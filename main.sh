#!/bin/bash

# Entry point for the YouTube CLI Tool
source ./utils/check_deps.sh
source ./utils/color.sh

# Check and load dependencies
check_dependencies

echo -e "${PURPLE}==== Made with ${RED}❤${RESET}${PURPLE} by Suman ====${RESET}"

# Launch menu
source ./menu.sh

