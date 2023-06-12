export ZVM_INIT_MODE=sourcing
export TERM="xterm-256color"

export SHELL_CONF_DIR = $HOME/git/dotfiles
export SHELL_FUNCTIONS_DIR = $SHELL_CONF_DIR/functions
export SHELL_ALIASES = $SHELL_CONF_DIR/aliases/aliases.sh
export LOCAL_CONFIG = $SHELL_CONF_DIR/local/zsh.local

# **** zsh configs (zinit, fzf ...) **** #
for conf in $SHELL_CONF_DIR/.config/zsh/*; do 
  source $conf; 
done

# **** Starship **** #
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# **** Aliases **** #
if test -f $SHELL_ALIASES; then
  source $SHELL_ALIASES
fi

# **** Functions **** #
for func in $SHELL_FUNCTIONS_DIR/*; do 
  source $func; 
done

# **** Bindings **** #
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^r' history-incremental-search-backward

# **** Local Config **** #
if test -f $LOCAL_CONFIG; then
  source $LOCAL_CONFIG
fi

