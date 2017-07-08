# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

BASE_DIR="$(dirname "${BASH_SOURCE[0]}")"
[[ -f "$BASE_DIR/bash-prompt.sh" ]] && source "$BASE_DIR/bash-prompt.sh"
[[ -f "$BASE_DIR/bash-alias.sh" ]] && source "$BASE_DIR/bash-alias.sh"
[[ -f "$BASE_DIR/bash-alias-completion.sh" ]] && source "$BASE_DIR/bash-alias-completion.sh"

# Color scheme for grep and ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_COLOR='1;35;40'
export LC_ALL=en_US.UTF-8

HISTTIMEFORMAT="%d/%m/%y %T "
