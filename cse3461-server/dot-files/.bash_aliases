# alias for diagnosing sleep issues on hackintosh
alias sleepless="pmset -g assertions | egrep '(PreventUserIdleSystemSleep|PreventUserIdleDisplaySleep)'"

# show hidden files
alias hidden='ls -a | grep "^\."'

# edit most recently modified file
alias vimr='vim `ls -rt | tail -n 1`'

alias pip=pip3

alias activate='source venv/bin/activate'

# export mysql to path
export PATH="/usr/local/mysql/bin:$PATH"

export PATH="$PATH:$HOME/flutter/bin"

export PATH="$PATH:$HOME/Downloads/gcc-arm-none-eabi-10-2020-q4-major/bin"

