# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
## Aliases
### General
alias zshconfig="vi ~/.zshrc"
### Git
alias lg="git log --graph --pretty=format:'%C(yellow)%d%Creset %C(cyan)%h%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short --all"
alias gc="git clone"
alias gs="git status"
alias gsh="git stash"
alias gsa="git stash apply"
alias ga="git add"
alias master="goto master"
### Docker
alias d="docker"
alias di="docker image"
alias doc="docker compose"

# User Functions
## Port function to show wether port is in use or not
## Usage: port 8080
port() {
   lsof -i ":$1"
}
## Connect to local psql db database with postgres user
## Usage: db <database_name>
db() {
  if [ -z "$1" ]; then 
    echo Please provide database you want to connect
  else
    psql -d $1 -U postgres
  fi
}

# Starship configuration
eval "$(starship init zsh)"
