#!/usr/bin/env bash

# Define color codes
BLUE='\033[34m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
RESET='\033[0m'

# Define variables
PROFILE_DIR="$HOME/.mozilla/firefox"
CSS_DIR="./firefox/chrome" # Directory containing your CSS files
PROFILE_NAME=$(ls -d $PROFILE_DIR/*.default-release*)

# Check if the CSS directory exists
if [ ! -d "$CSS_DIR" ]; then
    echo -e "${RED}CSS directory $CSS_DIR does not exist!${RESET}"
    exit 1
fi

# Check if the profile directory exists
if [ ! -d "$PROFILE_NAME" ]; then
    echo -e "${RED}Firefox profile directory $PROFILE_NAME does not exist!${RESET}"
    exit 1
fi

# Create chrome directory if it doesn't exist
CHROME_DIR="$PROFILE_NAME/chrome"
mkdir -p "$CHROME_DIR"

# Create symlinks to the CSS files
echo -e "${YELLOW}Creating symlinks for custom CSS files...${RESET}"
cp "$CSS_DIR/userChrome.css" "$CHROME_DIR/userChrome.css"
cp "$CSS_DIR/userContent.css" "$CHROME_DIR/userContent.css"

# Print success message
echo -e "${GREEN}Custom CSS symlinks created successfully!${RESET}"

# Optional: Prompt to restart Firefox
echo -e "${BLUE}Please restart Firefox to apply the changes.${RESET}"
