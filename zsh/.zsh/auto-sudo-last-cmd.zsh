sudo-last-command(){
	local line=${history[${#history}]}
	BUFFER="sudo $line"
	zle .accept-line
#	CURSOR=${#BUFFER}
}

zle -N sudo-last-command
# Bind to ctrl-alt-M
bindkey '^[^M' sudo-last-command 
