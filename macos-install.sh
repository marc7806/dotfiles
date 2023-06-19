#!/bin/bash
# Script for dotfiles setup

if [ "$#" -ne 1 ] || [ "$1" != "zsh" ] || "$1" != "fish" ]; then
    echo "Illegal number of arguments"
    echo "Please define what type of shell you want to install"
    echo "Available options: zsh, fish"
    echo "----"
    echo "Example: ./install.sh zsh"
fi

function sync_folder () {
  mkdir -p "$2"
  ln -snf $(pwd)/"$1" "$2"
}

function sync_file () {
  ln -sf $(pwd)/"$1" "$2"
}

function install_base_plugins () {
  echo "Install base plugins..."
  brew update
  brew upgrade
  echo "- Install autojump"
  brew install autojump
  echo "- Install exa"
  brew install exa
}

function configure_git () {
  echo "Configure git..."
  sync_file .files/.gitconfig ~/.gitconfig
  sync_folder .config/git ~/.config/git
}

function install_starship () {
  echo "Install and configure starship..."
  brew install starship
  sync_file .config/starship.toml ~/.config/starship.toml
}

function configure_vim () {
  echo "Install neovim"
  brew install neovim
  echo "Configure vim settings"
  sync_folder .config/nvim ~/.config/nvim
  sync_file .files/.vimrc ~/.vimrc
  sync_file .files/.ideavimrc ~/.ideavimrc
}

install_base_plugins
configure_vim
configure_git

if [ "$1" == "zsh" ];then
  echo "Configure zsh..."
  sync_folder .config/zsh ~/.config/zsh
  sync_file .files/.zshrc ~/.zshrc
fi

if [ "$1" == "fish" ];then
  echo "Install fish..."
  brew install fish
  echo "Configure fish..."
  sync_folder .config/fish ~/.config/fish
fi
