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



# Load alias
source ~/.zsh/aliasrc

# Load env
source ~/.zsh/set_env

source ~/.zsh/checks.zsh

source ~/.zsh/setopts.zsh

source ~/.zsh/functions.zsh


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


#------------------------------
# Comp stuff
#------------------------------
autoload -Uz compinit
compinit

autoload colors
colors

autoload -U add-zsh-hook


# Default compinit will not automatically find new executables in the $PATH.
# This 'rehash' can be set to happen automatically
zstyle ':completion:*' rehash true


zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


highlights='${PREFIX:+=(#bi)($PREFIX:t)(?)*==$color[red]=$color[green];$color[bold]}':${(s.:.)LS_COLORS}}
zstyle -e ':completion:*' list-colors \
	'reply=( "'$highlights'" )'
unset highlights




zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'


zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'




setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus


# if [ -n "$TMUX" ]; then
#     echo "inside TMUX"
# else
#     echo "outside tmux"
# fi

# fpath=(~/.zsh/functions $fpath)
# Load git prompt
[ -f ~/.zsh/git_prompt ] && source ~/.zsh/git_prompt

# For syntax zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
