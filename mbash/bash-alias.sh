# Load .bash_aliases
#if [ -f ~/.bash/bash_aliases ]; then
#    . ~/.bash/bash_aliases
#fi

# Load .bash_functions
#if [ -f ~/.bash/bash_functions ]; then
#    . ~/.bash/bash_functions
#fi

alias ll="ls -la"

alias gp="git pull"
alias gpu="git push"
alias gd="git diff"
alias gb="git branch"
alias gs="git show"
alias gco="git checkout"
alias gcm="git commit"
alias gl="git log"
alias gst="git status"
alias ga="git add"

alias rmvim="find ~/my_vim_bash/mvim/tmp -type f -not -name .gitignore -execdir bash -c 'rm {}' \;"

# for setting in git-completion.bash
# __git_complete gco _git_checkout
# __git_complete gp _git_pull
# __git_complete gpu _git_push
# __git_complete gd _git_diff
# __git_complete gb _git_branch
# __git_complete gcm _git_commit
# __git_complete gs _git_show
# __git_complete gl _git_log
# __git_complete gst _git_status



