# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
source /home/cuong.nx/my_bash/.bashrc

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