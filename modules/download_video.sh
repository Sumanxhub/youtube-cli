#!/bin/bash

source ./utils/color.sh

download_video() {
  source ./utils/path.sh
  local URL="$1"
  title=$(yt-dlp -e "$URL")

  echo ""
  echo -e "${RED}------------------------${RESET}"
  echo -e "${RED}Youtube Video Downloader${RESET}"
  echo -e "${RED}------------------------${RESET}"
  echo ""

  # Ask for download destination path
  local DEST_PATH 
  choose_download_path "$HOME/Videos/"
  # echo ""
  DEST_PATH="$RETURNED_PATH"
  # echo -e "${GREEN}Saving video to: $DEST_PATH${RESET}"
  
  # Fetch and show available video formats
  echo ""
  echo -e "${GREEN}-----------------------------------${RESET}"
  echo -e "${GREEN}Fetching available video formats...${RESET}"
  echo -e "${GREEN}-----------------------------------${RESET}"
  echo ""

  # yt-dlp -F "$NORMALIZED_URL" | awk '/^[0-9]+/ && /video/ && !/audio only/'
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
  echo -e "${CYAN}Downloading video : ${title}${RESET}"
  echo -e "${CYAN}Saving video to : $DEST_PATH${RESET}"
  echo ""
  yt-dlp \
      -f "$FORMAT_STRING" \
      --merge-output-format mp4 \
      -P "$DEST_PATH" \
      "$NORMALIZED_URL"
}

