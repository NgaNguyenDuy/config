# PROMPT_COMMAND='echo -ne "\033]0;Terminal | mplayer\007"'

#PROMPT=$'%{\e[1;31m%}❯%{\e[1;32m%}❯%{\e[1;34m%}❯ %F{white}'
#PROMPT=$'%{\033[5;31m%}%m%{\033[0m%} > '

# terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
# PS1_2='└─[%~]'

# export PS1="%{$terminfo_down_sc$PS1_2$terminfo[rc]%}┌─ %B%K{red}%F{white}%(?..(%?%)%k )%k%b%F{white}"$'%{\e[1m%}%{\e[1;31m%}❯%{\e[1;34m%}❯%{\e[1;32m%}❯ '
# preexec () { print -rn -- $terminfo[el]; }

# precmd () {print -Pn "\e]0;%n@%m: %~\a"}

#"$'%{\e[1m%}%{\e[1;31m%}❯%{\e[1;34m%}❯%{\e[1;32m%}❯ %B%K{red}%F{white}%(?..(%?%)%k )%k%b%F{white}'

# export PROMPT='%F{magenta}---%f %F{yellow}%(t.Ding!.%T)%f %F{cyan}%n@%m%f %F{green}%~%f %F{magenta}---%f
# %B%K{white}%F{red}%(?..(%?%)%k )%k%b%F{white}%# %f%k'

# Initial color for arrow
c1="red"
c2="green"
c3="yellow"

source ~/.zsh/aliasrc.zsh

source ~/.zsh/env.zsh

source ~/.zsh/checks.zsh

source ~/.zsh/setopts.zsh

source ~/.zsh/functions.zsh

source ~/.zsh/auto-sudo-last-cmd.zsh

source ~/.zsh/wordchars.zsh

source ~/.zsh/completion.zsh

source ~/.zsh/f.zsh

source ~/.zsh/listdirs.zsh

source ~/.zsh/bindkeys.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "`dircolors -b /home/tspyimt/.zsh/dircolors`"

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi


# start tmux by default
# if [[ "$TERM" != "screen-256color" ]]
# then
#     tmux attach-session -t "$USER" || tmux new-session -s "$USER"
#     exit
# fi



autoload colors
colors

autoload -U add-zsh-hook


setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus


if ! [ -n "$TMUX" ]; then
    lastlogin
fi

# TMUX
# First, check tmux is installed?
# if which tmux >/dev/null 2>&1; then
#     # if no session is started, start a new session
#     test -z ${TMUX} && tmux new -s "$USER@basic"

#     # when quitting tmux, try to attach
#     while test -z ${TMUX}; do
#         tmux attach || break
#     done
# fi

# fpath=(~/.zsh/functions $fpath)
# Load git prompt
[ -f ~/.zsh/git_prompt ] && source ~/.zsh/git_prompt


# For syntax zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
