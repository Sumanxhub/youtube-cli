#!/bin/bash

# Load required menu actions from modules
source ./modules/listen_audio.sh
source ./modules/watch_video.sh
source ./modules/download_audio.sh
source ./modules/download_video.sh
source ./utils/normalize.sh 
source ./utils/color.sh 

while true; do
    echo -e "${RED}====== YouTube CLI Tool ======${RESET}"
    echo ""
    echo -e "${YELLOW}1. Listen Audio${RESET}"
    echo -e "${YELLOW}2. Watch Video${RESET}"
    echo -e "${YELLOW}3. Download Audio${RESET}"
    echo -e "${YELLOW}4. Download Video${RESET}"
    echo -e "${YELLOW}5. Exit${RESET}"
    echo ""
    echo -e "${RED}==========================${RESET}"

    read -p "$(echo -e "${GREEN}Enter your choice: ${RESET}")" choice

    case "$choice" in
        5)
            echo -e "${RED}Exiting. Goodbye!${RESET}"
            exit 0
            ;;

        1|2|3|4)
          read -p "$(echo -e "${GREEN}Enter YouTube URL or video ID: ${RESET}")" RAW_URL
            NORMALIZED_URL=$(normalize_url "$RAW_URL")

            if [ -z "$NORMALIZED_URL" ]; then
                echo -e "${RED}Invalid YouTube link or ID!${RESET}"
                continue
            fi
            ;;
        *)
            echo -e "${RED}Invalid choice.${RESET}"
            continue
            ;;
    esac

    case "$choice" in
        1)
            listen_audio "$NORMALIZED_URL"
            ;;
        2)
            watch_video "$NORMALIZED_URL"
            ;;
        3)
            download_audio "$NORMALIZED_URL"
            ;;
        4)
            download_video "$NORMALIZED_URL"
            ;;
    esac
done

