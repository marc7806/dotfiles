# marc7806 dotfiles

This repository contains all my shell configurations.
The setup guide is designed for **macOS** users.

## Installation

1. Clone this repository on your machine under the following
   path `~/git/dotfiles`. This is important for referencing files.
2. Run `./macos-install.sh <fish|zsh>` for macOS installation.
   This requires `brew` as package manager.
   The install script creates symlinks for the configuration files.
3. If you want to have specific local settings, then
   add them in the specific files under `./local/` folder.

## Core plugins

- [Starship](https://starship.rs/)
  - Amazing shell prompt
- [Autojump](https://github.com/wting/autojump)
  - Quick jump to directories using `j <dir>`
- [exa](https://the.exa.website/)
  - Better `ls`
- [nvim](https://neovim.io/)
  - Extensible Vim editor
  - Install nvim plugins using `:PackerInstall`
