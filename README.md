# marc7806 dotfiles

This repository contains all my shell configurations.
The setup guide is designed for **macOS** users.

## Shell Setup

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

### zsh

### fish

1. Install fish

```bash
brew install fish
```

2. Copy `.config/fish` folder to your home config folder
3. Make sure the `SHELL_CONF_DIR` variable inside `config.fish`
   is correctly set to the dofiles folder path

---

## nvim

1. Install neovim

```bash
brew install neovim
```

2. Copy nvim config folder to `~/.config`
3. Install nvim plugins using `:PackerInstall`
