#!/bin/bash
# Script for dotfiles setup

if [ "$#" -ne 1 ] || [ "$1" != "zsh" ] || "$1" != "fish" ]; then
    echo "Illegal number of arguments"
    echo "Please define what type of shell you want to install"
    echo "Available options: zsh, fish"
    echo "----"
    echo "Example: ./install.sh zsh"
fi

function setup_config_structure () {
  echo "Configure folder structure..."  

}

function install_base_plugins () {
  echo "Install base plugins..."
  brew update
  brew upgrade
  echo "- Install starship"
  brew install starship
  echo "- Install autojump"
  brew install autojump
  echo "- Install exa"
  brew install exa
  echo "- Install neovim"
  brew install neovim
}

if [ "$1" == "zsh" ];then
  echo "Configure zsh..."

fi

if [ "$1" == "fish" ];then
  echo "Install fish..."
  brew install fish
  echo "Configure fish..."

fi
