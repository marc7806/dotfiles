set fish_greeting ""
set -gx TERM xterm-256color

set SHELL_CONF_DIR $HOME/git/dotfiles
set SHELL_FUNCTIONS_DIR $SHELL_CONF_DIR/functions
set SHELL_ALIASES $SHELL_CONF_DIR/aliases/aliases.sh
set LOCAL_CONFIG $SHELL_CONF_DIR/local/fish.local

# see: https://fishshell.com/docs/current/interactive.html
set fish_cursor_default block blink
set fish_cursor_insert underscore
set fish_cursor_replace_one underscore

# **** Starship **** #
starship init fish | source

# **** Aliases **** #
if test -f $SHELL_ALIASES
  source $SHELL_ALIASES
end

# **** Local Config **** #
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# **** Bindings **** #
# see list of available commands: 
# https://fishshell.com/docs/current/cmds/bind.html
bind -M default \_ beginning-of-line
bind -M insert \ci complete-and-search
bind -M insert \cr history-pager
bind -M default \cr history-pager
bind -M insert \cb prevd-or-backward-word repaint
bind -M default \cb prevd-or-backward-word repaint
bind -M insert \cn nextd-or-forward-word repaint
bind -M default \cn nextd-or-forward-word repaint
