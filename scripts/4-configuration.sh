#!/usr/bin/env bash

# Define color codes
BLUE='\033[34m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
RESET='\033[0m'

echo
echo -e "${BLUE}Configuring System${RESET}"
echo

# --- Stow ---
echo -e "${YELLOW}Stowing dotfiles...${RESET}"
# Stow dotfiles
stow -v -t ~ 

# --- Configure Zsh ---
echo
echo -e "${YELLOW}Configuring Zsh...${RESET}"

# Get the current user's default shell from /etc/passwd
DEFAULT_SHELL=$(grep "^$(whoami):" /etc/passwd | cut -d: -f7)

# Check if Zsh is already the default shell
if [ "$DEFAULT_SHELL" != "/bin/zsh" ]; then
    # Set Zsh as the default shell
    echo -e "${YELLOW}Changing default shell to Zsh...${RESET}"
    chsh -s /bin/zsh
else
    echo -e "${GREEN}Zsh is already the default shell.${RESET}"
fi
# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --- Configure Firefox ---
echo
echo -e "${YELLOW}Configuring Firefox...${RESET}"

# Set up Firefox default profile
./scripts/4-configuration-firefox.sh

# --- Configure NetworkManager ---
echo
echo -e "${YELLOW}Configuring NetworkManager...${RESET}"
# Add NetworkManager dispatcher script
if [ ! -f /etc/NetworkManager/dispatcher.d/100-enable-disable-wifi ]; then
    sudo cp ./scripts/dispatcher/100-enable-disable-wifi.sh /etc/NetworkManager/dispatcher.d/100-enable-disable-wifi
    sudo chmod +x /etc/NetworkManager/dispatcher.d/100-enable-disable-wifi
    echo -e "${GREEN}NetworkManager dispatcher script added successfully.${RESET}"
else
    echo -e "${YELLOW}NetworkManager dispatcher script already exists.${RESET}"
fi