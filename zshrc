# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  git
  zsh-autosuggestions
  web-search
)

# auto completion strategy
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^r' history-incremental-search-backward

# User configuration
export ZSH="$HOME/.oh-my-zsh"
export GITPATH="$HOME/git"
export FLUTTER="/Users/marc/Utils/flutter/bin"

export PATH="$GITPATH/marc7806/dotfiles/scripts:$PATH"

# Aliases
# Git -------------------------
alias lg="git log --graph --pretty=format:'%C(yellow)%d%Creset %C(cyan)%h%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short --all"
alias gc="git clone"
alias gs="git status"
alias gsh="git stash"
alias gsa="git stash apply"
alias ga="git add"

# Git commit shorthand
gcom() { git commit -m "$1"; }

# Checkout new branch and create if necessary
goto() {
  git checkout $1
  if [ $? -ne 0 ]; then
    git checkout -b $1
  fi
}
alias master="goto master"

# Docker ----------------------
alias d="docker"
alias di="docker image"

# Database -------------------
# Connect to local psql db database with postgres user
# Usage: codb <database_name>
cdb() {
  if [ -z "$1" ]; then 
    echo Please provide database you want to connect
  else
    psql -d $1 -U postgres
  fi
}

# Port function to show wether port is in use or not
# Usage: port 8080
port() {
  lsof -i ":$1"
}

# Edit zshconfig -> add it to git -> apply it
zshrc() {
  nano ~/.zshrc
  cp ~/.zshrc $GITPATH/marc7806/dotfiles/zshrc
  . ~/.zshrc
}

source $ZSH/oh-my-zsh.sh
