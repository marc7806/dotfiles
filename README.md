# marc7806 dotfiles

This repository contains all my shell configurations.
The setup guide is designed for **macOS** users.

## Shell Setup

### Installation

Run `./macos-install.sh <fish|zsh>` for macOS installation.
This requires `brew` as package manager.
The install script creates symlinks for the configuration files.

If you want to have specific local settings, then
add them in the specific files under `./local/` folder.

### Core plugins

The shell setup uses some core plugins that first need to
be installed in order to have a working configuration:

- [Starship](https://starship.rs/)
  - `brew install starship`
  - Copy `.config/starship.toml` to home config folder
- [Autojump](https://github.com/wting/autojump)
  - `brew install autojump`
- [exa](https://the.exa.website/)
  - `brew install exa`

---

## nvim

1. Install neovim

```bash
brew install neovim
```

2. Copy nvim config folder to `~/.config`
3. Install nvim plugins using `:PackerInstall`
