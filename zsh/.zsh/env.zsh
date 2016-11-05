export FF=~/.bin/firefoxdev
export NODE_V012=~/.bin/node_0.12_x64
export NODE_V5=~/.bin/node-v5.2.0-linux-x64
export NODE_V6=~/.bin/node-v6.5.0-linux-x64
export MONGODB=~/.bin/mongodb_64_3.0
export IOJS=~/.bin/iojs-v3.3.1-x64
export EMACS_CFG=~/src/emacs
export PERL5=/home/tspyimt/perl5
export ERL=~/.bin/erlang
export LFS=/mnt/lfs
export ATV=~/myPrj/ARTPLUS.INC/SourceCode/newART/artplus.com


PATH=$PATH:$FF:$NODE_V6:$NODE_V5/bin:$MONGODB/bin:$IOJS/bin:$HOME/.bin:$EMACS_CFG:$HOME/.rvm/bin:$PERL5/bin:$ERL/bin; export PATH


PERL5LIB="/home/tspyimt/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tspyimt/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tspyimt/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tspyimt/perl5"; export PERL_MM_OPT;


export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
