#!/bin/bash

source ./utils/color.sh

watch_video() {
  local URL="$1"
  title=$(yt-dlp -e "$URL")

  echo ""
  echo -e "${GREEN}-----------------------------------${RESET}"
  echo -e "${GREEN}Fetching available video formats...${RESET}"
  echo -e "${GREEN}-----------------------------------${RESET}"
  echo ""

  yt-dlp -F "$URL" | awk '
  BEGIN {
      YELLOW = "\033[1;33m"
      RESET = "\033[0m"
      printf YELLOW "%-6s %-10s %10s\n" RESET, "ID", "Resolution", "Size"
      print YELLOW "----------------------------------------" RESET
  }
  $0 ~ /https/ && $0 ~ /mp4/ && $0 ~ /av01/ {
      printf YELLOW "%-6s %-10s %10s\n" RESET, $1, $3, $6
  }'


  echo ""
  read -p "$(echo -e "${GREEN}Enter the video format code (numeric only): ${RESET}")" VIDEO_FORMAT

  if ! [[ "$VIDEO_FORMAT" =~ ^[0-9]+$ ]]; then
      echo -e "${RED}Invalid format code. Only numeric values are allowed.${RESET}"
      exit 1
  fi

  FORMAT_STRING="${VIDEO_FORMAT}+bestaudio"

  echo ""
  echo -e "${CYAN}Playing : $title${RESET}"
  mpv --ytdl-format="$FORMAT_STRING" "$URL"
}

