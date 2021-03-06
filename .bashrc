# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.
# my ALIASES :)
alias ls='ls -B --color=auto'
alias la='ls -AB'
alias ll='ls -lB'
alias lla='ls -lAB'
alias tree="tree -I '*~'"
alias tailnf="tail -n+1 -f"

alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'

alias rm='rm -I --preserve-root'

alias emacs='emacs -nw'
alias emasc='emacs -nw' # lolol
alias tm='tmux -2'
alias tmuxls='tmux ls'
alias tmuxad='tmux -2 a -d'

# my ENV VARIABLES
HISTSIZE=10000            # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=10000
PYTHONDONTWRITEBYTECODE=1 # block *.pyc files
TERM=screen-256color
EDITOR='emacs -nw' # Utmost importance

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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
    elif [[ "$TERM" == "dumb" ]]; then
	PS1='\u@\h:\w \$ '
    else
        #OLD PS1: PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
	#CUSTOM PS1
	bold="\[$(tput bold)\]"
	red="\[$(tput setaf 1)\]"
	green="\[$(tput setaf 2)\]"
	yellow="\[$(tput setaf 3)\]"
	cyan="\[$(tput setaf 6)\]"
	reset="\[\033[00m\]"

	boldGreen="$bold$green"
	boldYellow="$bold$yellow"
	boldRed="$bold$red"
	plainCyan="$reset$cyan"

	#	PS1="$boldGreen\u@\h:$yellow\w $plainCyan\$(__git_ps1 '(%s)') $boldYellow\$ $reset"
	PS1="$boldGreen\u@\h:$yellow\w $boldYellow\$ $reset"
    fi

    alias grep='grep --colour=auto'
else
    PS1='\u@\h \w \$ '
fi

# Shortens PS1 by hiding /u /h
shorten() {
    PROMPT_DIRTRIM=3
    PS1="$boldYellow\w $plainCyan\$(__git_ps1 '(%s)') $boldYellow\$ $reset"
}

# Re-expands PS1
expand() {
    PROMPT_DIRTRIM=0
    PS1="$boldGreen\u@\h:$yellow\w $boldYellow\$ $reset"
}

echo '~/.bashrc has run'
