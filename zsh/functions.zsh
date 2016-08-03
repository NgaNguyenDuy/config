#!/bin/sh
#------------------------------
# ShellFuncs
#------------------------------

# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# -- create dir and cd into it.
mcd() { mkdir -p $1 && cd $1; }

# SSH argent
SSH_ENV="$HOME/.ssh/environment"

start_agent() {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

generate_prompt() {
    export PROMPT="%F{magenta}---%f %B%F{yellow}%(t.Ding!.%T)%f%b %B%F{cyan}%n@%m%f%b %B%F{green}%~%f%b %F{magenta}---%f
%B%F{$c1}❯%F{$c2}❯%F{$c3}❯ %K{white}%F{red}%(?..(%?%)%k )%k%b% %B"

    export RPROMPT='$(git_super_status)'
}

generate_pattern_colors() {
    colors=("red" "green" "yellow")
    # echo ${#colors[@]} 
    rand=$(( $RANDOM % (3) + 1 ))
    c1=${colors[$rand]}
    
    if [ "$rand" -eq 2 ]; then
        tmp_c2=$(( $rand + 1 ))
        tmp_c3=$(( $rand - 1 ))
    elif [ "$rand" -eq 3 ]; then
        tmp_c2=$(( $rand -1 ))
        tmp_c3=$(( $rand -2 ))
    else
        tmp_c2=$(( $rand +1 ))
        tmp_c3=$(( $rand +2 ))
    fi
    
    c2=${colors[$tmp_c2]}
    c3=${colors[$tmp_c3]}
}

preexec () {
    
}


precmd () {
    generate_pattern_colors
    generate_prompt
    # Dynamic title in terminal
    print -Pn "\e]0;zsh-%l %(1j,%j job%(2j|s|); ,)%~\a"
}