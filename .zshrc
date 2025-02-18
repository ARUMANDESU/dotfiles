# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export OBSIDIAN=~/Obsidian
export MY_VOULT=$OBSIDIAN/MyVoult

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH:$GOROOT:$GOBIN:$GOROOT/bin:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin
export PATH=$PATH:/usr/local/bin
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
alias ff='fastfetch'
alias vim='nvim'
# Golang specific aliases
alias gmt='go mod tidy'
alias gv='go vet ./...'

# Quick kubernetes cluster commands
alias k='kubectl'
alias kn='kubectl get nodes'
alias kp='kubectl get pods'
alias ka='kubectl get all'


# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init --cmd cd zsh)"
