# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export OBSIDIAN=~/Obsidian
export MY_VOULT=$OBSIDIAN/MyVoult

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH:$GOROOT:$GOBIN:$GOROOT/bin:$HOME/.local/bin:$HOME/bin

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gnome-keyring/ssh"
export GPG_AGENT_INFO="$XDG_RUNTIME_DIR/gnome-keyring/gpg"
export GPG_TTY=$(tty)

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dst"

plugins=(
    git
    archlinux
    sudo 
    zsh-256color
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
# pokemon-colorscripts --no-title -s -r

# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias gcommits="git log --oneline --graph --decorate --all"

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
