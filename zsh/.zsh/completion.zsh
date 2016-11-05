#------------------------------
# Comp stuff
#------------------------------
autoload -Uz compinit
compinit

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

# Correccion mayusc -> minusc
zstyle ':completion:*' completer _expand _complete _ignored #_approximate 
# completar / al final de los directorios
zstyle ':completion:*' special-dirs true

# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.zsh/.zsh_cache

zstyle ':completion:*' show-completer 'true' 

zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
zstyle ':completion:matches' group 'yes'

# pager cuando menucomp no cabe en pantalla
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

zstyle ':completion:*:processes-names' command 'ps -e -o comm='

