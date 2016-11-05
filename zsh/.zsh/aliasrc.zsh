local -a FEH

alias ~='cd ~'
alias ..='cd ..' # Go up one directory
alias ...='cd ..; ..' # Go up two directories

alias ls='ls --color=auto --human-readable --group-directories-first --classify'
alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lx='ll -XB'        # Lists sorted by extension (GNU only).
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.


alias get="wget -t0 -c"
alias rm='rm -iv --preserve-root'
alias mv='mv -iv'
alias ra='rlwrap racket'
alias ck='rlwrap csi'
alias cl='rlwrap sbcl'
alias cpan='rlwrap cpan'
alias irc='rlwrap irssi'
alias tmoz='rlwrap telnet localhost 4242'
alias img='viewnior'
alias c='clear'
alias et='emacsclient -t'
alias ec='emacsclient'
alias ping='ping -c 4'

# Disable globbing for a few commands
# Globbing: https://goo.gl/3B3LYF
alias ssh-keygen='noglob ssh-keygen'

# Custom alias
alias .='source'

# alias static='python -m SimpleHTTPServer'


FEH=(
  bmp
  cdr
  gif
  ico
  jpeg
  jpg
  JPG
  png
  PNG
  svg
  xpm
)

alias -s $^FEH='feh -Fzrd --'

if which colordiff > /dev/null 2>&1; then
alias diff="colordiff -Nuar"
else
alias diff="diff -Nuar"
fi
