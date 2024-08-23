#!/usr/bin/env bash

# Define color codes
BLUE='\033[34m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
RESET='\033[0m'

echo
echo -e "${BLUE}Installing Base System${RESET}"
echo

PKGS=(
    # --- System Essentials ---
    'base-devel'
    'git'
    'wget'
    'curl'
)

echo -e "${YELLOW}Updating the system...${RESET}"
# Update the system
sudo pacman -Syu --noconfirm

echo -e "${YELLOW}Installing basic dependencies...${RESET}"

for pkg in "${PKGS[@]}"; do
    if ! pacman -Q "$pkg" &>/dev/null; then
        echo -e "${GREEN}Installing $pkg...${RESET}"
        sudo pacman -S --noconfirm "$pkg"
    else
        echo -e "${YELLOW}$pkg ${GREEN}is already installed.${RESET}"
    fi
done

echo
echo -e "${GREEN}Done!${RESET}"
echo
