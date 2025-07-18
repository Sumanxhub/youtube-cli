#!/bin/bash

source ./utils/color.sh

listen_audio() {
    local URL="$1"
    title=$(yt-dlp -e "$URL")

    echo ""
    echo -e "${CYAN}Playing : $title${RESET}"
    mpv --no-video --ytdl-format=bestaudio "$URL"
}

