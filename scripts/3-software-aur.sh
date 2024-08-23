#!/usr/bin/env bash

# Define color codes
BLUE='\033[34m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
RESET='\033[0m'

echo
echo -e "${BLUE}Installing AUR Software${RESET}"
echo

PKGS=(
    # --- Development Tools ---
    'goland' # GoLand IDE
    'goland-jre'
    'postman-bin' 
    'visual-studio-code-bin' 

    # --- System Utilities ---
    'envycontrol' # CLI tool for Nvidia Optimus systems

    # --- Communication ---
    'vesktop-git' # Lightweight desktop environment
)

for pkg in "${PKGS[@]}"; do
    if ! yay -Q "$pkg" &>/dev/null; then
        echo -e "${YELLOW}Installing $pkg...${RESET}"
        yay -S --noconfirm --needed "$pkg"
    else
        echo -e "${YELLOW}$pkg ${GREEN}is already installed.${RESET}"
    fi
done

echo
echo -e "${GREEN}Done!${RESET}"
echo
