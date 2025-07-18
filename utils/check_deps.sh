#!/bin/bash

check_dependencies() {
    local dependencies=("yt-dlp" "mpv" "awk")

    for dep in "${dependencies[@]}"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            echo "Error: '$dep' is not installed. Please install it before running this tool."
            exit 1
        fi
    done
}

