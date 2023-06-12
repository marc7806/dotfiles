# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ll="exa --long -g --all"
alias l="ll"
alias lt="ll --tree --level=2"

# Vim
alias vi="nvim"

# Git 
alias g="git"
alias lg="git log --graph --pretty=format:'%C(yellow)%d%Creset %C(cyan)%h%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short --all"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gs="git status"
alias gc="git commit"
alias gsh="git stash"
alias gsl="git stash list"
alias gsa="git stash apply"
alias gsp="git stash pop"
alias ga="git add"
alias master="git checkout master"
alias main="git checkout main"
alias gb="git branch -vv -a"

# Docker 
alias d="docker"
alias di="docker image"
alias doc="docker compose"

# Kubernetes
alias k="kubectl"
