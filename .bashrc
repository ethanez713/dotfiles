# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# my aliases :)
alias ls='ls -B --color=auto'
alias la='ls -AB'
alias ll='ls -lB'
alias lla='ls -lAB'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'

alias rm='rm -I --preserve-root'

alias emacs='emacs -nw'
alias emasc='emacs -nw' # lolol
alias chrome='chromium-browser &> /dev/null &'
alias update='sudo aptitude update'
alias upgrade='sudo aptitude upgrade'

# Make directory then cd into it
mcd() {
    mkdir -p $1
    cd $1
}

# Change directory then ls
cl() {
    cd $1
    ls
}

# CipherHealth 2015
alias cuke='cucumber'
alias eugene='ssh guest@88.80.187.105'
alias tc='cd ~/workspace/tiger_chicken; ls'
alias ba='cd ~/workspace/banff; ls'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# allows less to read non-text files
eval "$(lessfile)"

# trims the PS1 path
PROMPT_DIRTRIM=2

use_color=false

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
    && type -P dircolors >/dev/null \
    && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then

    # Enable colors for grep. Prefer ~/.dir_colors #64489
    if type -P dircolors >/dev/null ; then
	if [[ -f ~/.dir_colors ]] ; then
            eval $(dircolors -b ~/.dir_colors)
        elif [[ -f /etc/DIR_COLORS ]] ; then
            eval $(dircolors -b /etc/DIR_COLORS)
	else
	    eval $(dircolors)
        fi
    fi

    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        #OLD PS1: PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
	#CUSTOM PS1
	bold="\[$(tput bold)\]"
	red="\[$(tput setaf 1)\]"
	green="\[$(tput setaf 2)\]"
	yellow="\[$(tput setaf 3)\]"
	cyan="\[$(tput setaf 6)\]"
	reset="\[$(tput sgr0)\]"

	boldGreen="$bold$green"
	boldYellow="$bold$yellow"
	boldRed="$bold$red"
	plainCyan="$reset$cyan"

	PS1="$boldGreen\u@\h:$yellow\w$plainCyan\$(__git_ps1) $boldYellow\$ $reset"
    fi

    alias grep='grep --colour=auto'
else
    PS1='\u@\h \w \$ '
fi

# Shortens PS1 by hiding /u /h
shorten_ps1 () {
    export PS1="$boldGreen\w$plainCyan\$(__git_ps1) $boldYellow\$$reset "
}

# Re-expands PS1
expand_ps1 () {
    PS1="$boldGreen\u@\h:$yellow\w$plainCyan\$(__git_ps1) $boldYellow\$$reset "
}

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ]; then
    function command_not_found_handle {
	# check because c-n-f could've been removed in the meantime
        if [ -x /usr/lib/command-not-found ]; then
	    /usr/bin/python /usr/lib/command-not-found -- $1
            return $?
	else
	    return 127
	fi
    }
fi

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
