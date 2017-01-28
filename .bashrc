# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# User specific aliases and functions
source $HOME/my_vim_bash/mbash/.bashrc

alias ll="ls -la"

alias gp="git pull"
alias gpo="git push origin"
alias gd="git diff"
alias gb="git branch"
alias gs="git show"
alias gco="git checkout"
alias gcm="git commit"
alias gl="git log"
alias gst="git status"
alias ga="git add"

alias rmvim="find ~/my_vim_bash/mvim/tmp -type f -not -name .dont_remove -execdir bash -c 'rm {}' \;"

HISTTIMEFORMAT="%d/%m/%y %T "
