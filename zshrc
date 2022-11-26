export TERM="xterm-256color"
export ZVM_INIT_MODE=sourcing

# ------------------------------------------------------------ #
# **** ZINIT **** #
# ------------------------------------------------------------ #
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

setopt promptsubst

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^r' history-incremental-search-backward

# ------------------------------------------------------------ #
# **** Starship **** #
# ------------------------------------------------------------ #
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# ------------------------------------------------------------ #
# **** Plugins **** #
# ------------------------------------------------------------ #
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

zinit wait lucid for \
	OMZL::git.zsh \
	OMZL::clipboard.zsh \
	OMZL::compfix.zsh \
	OMZL::completion.zsh \
	OMZL::correction.zsh \
     atload"
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'
        alias .....='cd ../../../..'
        alias l='ls -lah --color=auto'
        alias ll='ls -lh --color=auto'
    " \
	OMZL::directories.zsh \
	OMZL::git.zsh \
	OMZL::grep.zsh \
	OMZL::history.zsh \
	OMZL::spectrum.zsh \
	OMZL::termsupport.zsh \
  OMZP::autojump \
  OMZP::git \
  OMZP::sudo

# ------------------------------------------------------------ #
# **** Exports / Config **** #
# ------------------------------------------------------------ #
export GITPATH="$HOME/git"
export PATH="$GITPATH/marc7806/dotfiles/scripts:$PATH"
export PATH=/Users/marc/bin:$PATH
# fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------ #
# **** Aliases **** #
# ------------------------------------------------------------ #
# Navigation
alias home='clear && cd ~ && ll'                                                # Home directory
alias downloads='clear && cd ~/Downloads && ll'
# Vim
alias vi="nvim"
# Git 
alias lg="git log --graph --pretty=format:'%C(yellow)%d%Creset %C(cyan)%h%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short --all"
alias gclone="git clone"
alias gs="git status"
alias gc="git commit"
alias gsh="git stash"
alias gsl="git stash list"
alias gsa="git stash apply"
alias gsp="git stash pop"
alias ga="git add"
alias master="goto master"
# Docker 
alias d="docker"
alias di="docker image"
alias doc="docker compose"

# ------------------------------------------------------------ #
# **** Helper Functions **** #
# ------------------------------------------------------------ #
# Checkout new branch and create if necessary
goto() {
  git checkout $1
  if [ $? -ne 0 ]; then
    git checkout -b $1
  fi
}
# Connect to local psql db database with postgres user
# Usage: codb <database_name>
cdb() {
  if [ -z "$1" ]; then 
    echo Please provide database you want to connect
  else
    psql -d $1 -U postgres
  fi
}
# Port function to show whether port is in use or not
# Usage: port 8080
port() {
  lsof -i ":$1"
}
# Edit zshconfig -> add it to git -> apply it
zshrc() {
  vi ~/.zshrc
  cp ~/.zshrc $GITPATH/marc7806/dotfiles/zshrc
  . ~/.zshrc
}
# Edit hosts file
hosts() { vi /etc/hosts }
# Creates a *.tar.gz archive of a file or folder
mktar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
# Create a *.zip archive of a file or folder
mkzip() { zip -r "${1%%/}.zip" "$1" ; } 
