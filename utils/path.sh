#!/bin/bash

source ./utils/color.sh

  choose_download_path() {
    local default_path="$1"
    echo ""
    echo -e "${YELLOW}Select download location:${RESET}"
    echo -e "${YELLOW}1. Default path ($default_path)${RESET}"
    echo -e "${YELLOW}2. Custom path${RESET}"
    echo ""

    read -p "$(echo -e "${GREEN}Enter your choice[1-2]: ${RESET}")" choice

    case "$choice" in
        1)
            RETURNED_PATH="$default_path"
            ;;
        2)
            read -p "$(echo -e "${GREEN}Enter custom path : ${RESET}")" custom_path
            custom_path="${custom_path/#\~/$HOME}"  # Expand ~ to full path

            if [ ! -d "$custom_path" ]; then
                echo -e "${RED}Directory doesn't exist. Creating: $custom_path${RESET}"
                mkdir -p "$custom_path"
            fi

            RETURNED_PATH="$custom_path"
            ;;
        *)
            echo -e "${YELLOW}Invalid choice. Using default path: $default_path${RESET}"
            RETURNED_PATH="$default_path"
            ;;
    esac
}
