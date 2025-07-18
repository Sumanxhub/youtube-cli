#!/bin/bash

source ./utils/color.sh

download_audio() {
    source ./utils/path.sh
    local URL="$1"
    title=$(yt-dlp -e "$URL")

    echo ""
    echo -e "${RED}------------------------${RESET}"
    echo -e "${RED}Youtube Audio Downloader${RESET}"
    echo -e "${RED}------------------------${RESET}"
    echo ""

    # Choose download path (default: ~/Music)
    local DEST_PATH
    choose_download_path "$HOME/Music/"
    DEST_PATH="$RETURNED_PATH"

    echo ""
    echo -e "${CYAN}Downloading audio : ${title}${RESET}"
    echo -e "${CYAN}Saving audio to : $DEST_PATH${RESET}"
    echo ""

    yt-dlp -x --audio-format mp3 --audio-quality 0 -P "$DEST_PATH" "$URL"
}

