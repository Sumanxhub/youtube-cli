#!/bin/bash

# Function to extract and normalize a YouTube video URL
normalize_url() {
    local RAW_URL="$1"
    local VIDEO_ID=""

    # Trim any newline or spaces
    RAW_URL=$(echo "$RAW_URL" | tr -d '\r\n ')

    # Match common YouTube URL formats and extract video ID
    if [[ "$RAW_URL" =~ ^https?:\/\/youtu\.be\/([a-zA-Z0-9_-]{11}) ]]; then
        VIDEO_ID="${BASH_REMATCH[1]}"
    elif [[ "$RAW_URL" =~ ^https?:\/\/(www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]{11}) ]]; then
        VIDEO_ID="${BASH_REMATCH[2]}"
    elif [[ "$RAW_URL" =~ ^[a-zA-Z0-9_-]{11}$ ]]; then
        VIDEO_ID="$RAW_URL"
    else
        echo ""
        return 1
    fi

    echo "https://www.youtube.com/watch?v=$VIDEO_ID"
}

