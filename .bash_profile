export PATH="/usr/local/bin:$PATH"
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

alias ls='ls -G'
alias ll='ls -lG'
alias gs='git status '
alias ga='git add '
alias gaa='git add -A '
alias gb='git branch '
alias gc='git commit '
alias gcm='git commit -m '
alias go='git checkout '


export PATH="$PATH:/Applications/DevDesktop/tools"
