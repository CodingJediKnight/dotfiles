#!bash
# shellcheck disable=SC1090

case $- in
*i*) ;; # interactive
*) return ;;
esac

# ------------------------- distro detection -------------------------

export DISTRO
[[ $(uname -r) =~ Microsoft ]] && DISTRO=WSL2 #TODO distinguish WSL1
#TODO add the rest

# ---------------------- local utility functions ---------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- environment variables ----------------------

export LANG=ru_RU.UTF-8
export USER="${USER:-$(whoami)}"
export TERM=xterm-256color
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
export GOPROXY=direct
export CGO_ENABLED=0

export LESS="-FXR"
export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me=""      # "0m"
export LESS_TERMCAP_se=""      # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue=""      # "0m"
export LESS_TERMCAP_us="[4m"  # underline

# ------------------------------- pager ------------------------------

if [[ -x /usr/bin/lesspipe ]]; then
	export LESSOPEN="| /usr/bin/lesspipe %s"
	export LESSCLOSE="/usr/bin/lesspipe %s %s"
fi

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
	if [[ -r "$HOME/.dircolors" ]]; then
		eval "$(dircolors -b "$HOME/.dircolors")"
	else
		eval "$(dircolors -b)"
	fi
fi

# ------------------------ bash shell options ------------------------

# shopt is for BASHOPTS, set is for SHELLOPTS

shopt -s checkwinsize # enables $COLUMNS and $ROWS
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob

#shopt -s nullglob # bug kills completion for some
#set -o noclobber

# -------------------------- stty annoyances -------------------------

#stty stop undef # disable control-s accidental terminal stops
stty -ixon # disable control-s/control-q tty flow control

# ------------------------------ history -----------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

#set -o vi
shopt -s histappend

# --------------------------- smart prompt ---------------------------
#                 (keeping in bashrc for portability)

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
	local P='$' dir="${PWD##*/}" B countme short long double \
		r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
		u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
		b='\[\e[36m\]' x='\[\e[0m\]'

	[[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ $dir = "$B" ]] && B=.
	countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

	[[ $B == master || $B == main ]] && b="$r"
	[[ -n "$B" ]] && B="$g($b$B$g)"

	short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
	long="${g}╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n${g}╚ $p$P$x "
	double="${g}╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir\n${g}║ $B\n${g}╚ $p$P$x "

	if ((${#countme} > PROMPT_MAX)); then
		PS1="$double"
	elif ((${#countme} > PROMPT_LONG)); then
		PS1="$long"
	else
		PS1="$short"
	fi
}

PROMPT_COMMAND="__ps1"

# ------------------------------ aliases -----------------------------
#      (use exec scripts instead, which work from vim and subprocs)

alias clear='printf "\e[H\e[2J"'
alias c='printf "\e[H\e[2J"'
alias more="less"
_have vim && alias vi=vim

# -------------------- personalized configuration --------------------

_source_if "$HOME/.bash_personal"
_source_if "$HOME/.bash_private"
_source_if "$HOME/.bash_work"
