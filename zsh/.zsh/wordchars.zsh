#####################################################
# zsh: stop backward-kill-word on directory delimiter
# Ref: (https://goo.gl/jKK6g8)
#####################################################
## For recent versions of zsh, simply add:
# autoload -U select-word-style
# select-word-style bash

# or an alternative with WORDCHARS
# the '$WORDCHARS' variable (non-alphanumeric chars treated as part of a word)
# is how zsh determines word. You just re-define this variable without the
# chars that you don't want zsh treat as part of a word.
# WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

custom-backward-kill-word(){
	if [[ $LASTWIDGET = *kill* ]]; then
		TMPBUFFER=$CUTBUFFER
	else
		TMPBUFFER=""
	fi
	local WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
	zle backward-kill-word 
	CUTBUFFER="$CUTBUFFER$TMPBUFFER"
}

zle -N custom-backward-kill-word

# Ctrl+w still treat / as part of word
bindkey "^w" custom-backward-kill-word
