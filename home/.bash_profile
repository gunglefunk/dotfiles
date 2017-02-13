# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export TERM=xterm

export SCREENDIR=$HOME/tmp;

PATH=/nike/local/ruby-2.1.2/bin:/nike/local/mysql-5.5.29/bin:/nike/local/perl/bin:/nike/local/httpd/bin:/nike/local/bin:$PATH:$HOME/bin:/nike/nagios/util
export PATH

LS_COLORS="no=00:fi=00:di=01;34;47:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:"
export LS_COLORS

set_prompt () {
    Last_Command=$? # Must come first!
    Blue='\[\e[01;36m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

    # Add a bright white exit status for the last command
    PS1="$White\$? "
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\\w >$Reset "
}
PROMPT_COMMAND='set_prompt'

export HISTTIMEFORMAT="%F %T "

function randpw(){ < /dev/urandom tr -dc '~!@#$%^&*()_A-Z-a-z-0-9' | head -c${1:-8};echo;}
function randpw16(){ <  /dev/urandom tr -dc '~!@#$%^&*()_A-Z-a-z-0-9' | head -c${1:-16};echo;}
function randpw40(){ <  /dev/urandom tr -dc '~!@#$%^&*()_A-Z-a-z-0-9' | head -c${1:-40};echo;}
function randpw64(){ <  /dev/urandom tr -dc '~!@#$%^&*()_A-Z-a-z-0-9' | head -c${1:-64};echo;}

function ts(){ /bin/date -d @$@; }

function d2x(){ printf "%x\n" $@; }
function d2o(){ printf "%o\n" $@; }
function h2d(){ printf "%d\n" 0x$@; }
function o2d(){ printf "%d\n" 0$@; }
function extascii(){ grep [\x00-\x1F\x7F-\xFF]+ $@; }

alias l='/bin/ls  -aFChl --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias lr='/bin/ls -altrFh --color=auto'
alias ls='/bin/ls -aFCh --color=auto'

