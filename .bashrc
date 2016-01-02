# .bashrc

# User specific aliases and functions
source $HOME/mbash/.bashrc

alias ll="ls -la --color=auto"

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

alias rmvim="find ~/mvim/tmp -type f -not -name .dont_remove -execdir bash -c 'rm {}' \;"

HISTTIMEFORMAT="%d/%m/%y %T "
