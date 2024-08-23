#!/usr/bin/env bash

# Define color codes
BLUE='\033[34m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
RESET='\033[0m'

echo
echo -e "${BLUE}Installing Software${RESET}"
echo

PKGS=(
    # --- Web Browsers ---
    'firefox'               # Web browser
    
    # --- File Managers ---
    'dolphin'               # File manager
    'dolphin-plugins'       # Extra Dolphin functionality

    # --- System Utilities ---
    'eza'                   # A modern replacement for ls
    'fastfetch'             # A system information tool written in C
    'konsole'               # Terminal emulator
    'openssh'
    'pavucontrol'           # PulseAudio Volume Control
    'xwaylandvideobridge'   # XWayland Video Bridge
    'zsh'                   # Zsh shell
    'stow'                 # Symlink farm manager

    # --- Multimedia ---
    'gwenview'              # Image viewer
    'okular'                # Document viewer
    'obs-studio'            # Screen recording and streaming software
    'spotify-launcher'      # Spotify launcher
    'vlc'                   # Media player

    # --- Productivity ---
    'syncthing'             # File synchronization program
    'obsidian'              # Note-taking and knowledge management app
    'telegram-desktop'      # Telegram Desktop
)

for pkg in "${PKGS[@]}"; do
    if ! pacman -Q "$pkg" &>/dev/null; then
        echo -e "${YELLOW}Installing $pkg...${RESET}"
        sudo pacman -S --noconfirm "$pkg"
    else
        echo -e "${YELLOW}$pkg ${GREEN}is already installed.${RESET}"
    fi
done

echo
echo -e "${GREEN}Done!${RESET}"
echo
