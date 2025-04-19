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
#                           (also see envx)
#export LANG=C.UTF8
export USER="${USER:-$(whoami)}"
export GITUSER="CodingJediKnight"
export GLUSER="JediKnight"
export TZ=Europe/Moscow
export REPOS="$HOME/code/repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export GLREPOS="$REPOS/gitlab.com/$GLUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export SNIPPETS="$DOTFILES/snippets"
export HELP_BROWSER=lynx
export TERM=xterm-256color
export HRULEWIDTH=73
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GLUSER/*"
#export GOPATH="$HOME/.local/go"
#export GOBIN="$HOME/.local/bin"
#export GOPROXY=direct
export GOPROXY="https://proxy.golang.org"
export CGO_ENABLED=0
#export PYTHONDONTWRITEBYTECODE=2
#export LC_COLLATE=C
#export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"

export LESS="-FXR"
export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me=""      # "0m"
export LESS_TERMCAP_se=""      # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue=""      # "0m"
export LESS_TERMCAP_us="[4m"  # underline

export ANSIBLE_CONFIG="$HOME/.config/ansible/config.ini"
export ANSIBLE_INVENTORY="$HOME/.config/ansible/inventory.yaml"
export ANSIBLE_LOAD_CALLBACK_PLUGINS=1
#export ANSIBLE_STDOUT_CALLBACK=json

#export DOCKER_HOST=unix:///home/user/.docker/run/docker.sock

[[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# ----------------------------- PostgreSQL ----------------------------

export PGDATABASE=cowork

# -------------------------------- gpg -------------------------------

export GPG_TTY=$(tty)

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

# ------------------------------- path -------------------------------

pathappend() {
	declare arg
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//":$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="${PATH:+"$PATH:"}$arg"
	done
} && export -f pathappend

pathprepend() {
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//:"$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":${PATH}"}"
	done
} && export -f pathprepend

# remember last arg will be first in path
pathprepend \
	"$HOME/.local/bin" \
	"$HOME/.local/go/bin" \
	"$HOME/go/bin" \
	"$GHREPOS/cmd-"* \
	/opt/homebrew/bin \
	/usr/local/go/bin \
	/usr/local/opt/openjdk/bin \
	/usr/local/bin \
	"$SCRIPTS"

pathappend \
	/usr/local/opt/coreutils/libexec/gnubin \
	'/mnt/c/Program Files (x86)/VMware/VMware Workstation' \
	/mingw64/bin \
	/usr/local/bin \
	/usr/local/sbin \
	/usr/local/games \
	/usr/games \
	/usr/sbin \
	/usr/bin \
	/snap/bin \
	/sbin \
	/bin

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$GHREPOS:$DOTFILES:$REPOS:/media/$USER:$HOME"

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

set -o vi
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

# ----------------------------- keyboard -----------------------------

# only works if you have X and are using graphic Linux desktop

_have setxkbmap && test -n "$DISPLAY" &&
	setxkbmap -option caps:escape &>/dev/null

# ------------------------------ aliases -----------------------------
#      (use exec scripts instead, which work from vim and subprocs)

_source_if "$HOME/.aliases"
alias '?'=duck
alias '??'=gpt
alias '???'=google
alias temp='cd $(mktemp -d)'
_have vim && alias vi=vim

# ----------------------------- functions ----------------------------

lesscoloroff() {
  while IFS= read -r line; do
    unset ${line%%=*}
  done < <(env | grep LESS_TERM)
} && export -f lesscoloroff

envx() {
	local envfile="${1:-"$HOME/.env"}"
	[[ ! -e "$envfile" ]] && echo "$envfile not found" && return 1
	while IFS= read -r line; do
		name=${line%%=*}
		value=${line#*=}
		[[ -z "${name}" || $name =~ ^# ]] && continue
		export "$name"="$value"
	done <"$envfile"
} && export -f envx

[[ -e "$HOME/.env" ]] && envx "$HOME/.env"

new-from() {
	local template="$1"
	local name="$2"
	! _have gh && echo "gh command not found" && return 1
	[[ -z "$name" ]] && echo "usage: $0 <name>" && return 1
	[[ -z "$GHREPOS" ]] && echo "GHREPOS not set" && return 1
	[[ ! -d "$GHREPOS" ]] && echo "Not found: $GHREPOS" && return 1
	cd "$GHREPOS" || return 1
	[[ -e "$name" ]] && echo "exists: $name" && return 1
	gh repo create -p "$template" --public "$name"
	gh repo clone "$name"
	cd "$name" || return 1
}

clone() {
	local repo="$1" user
	local repo="${repo#https://github.com/}"
	local repo="${repo#git@github.com:}"
	if [[ $repo =~ / ]]; then
		user="${repo%%/*}"
	else
		user="$GITUSER"
		[[ -z "$user" ]] && user="$USER"
	fi
	local name="${repo##*/}"
	local userd="$REPOS/github.com/$user"
	local path="$userd/$name"
	[[ -d "$path" ]] && cd "$path" && return
	mkdir -p "$userd"
	cd "$userd"
	echo gh repo clone "$user/$name" -- --recurse-submodule
	gh repo clone "$user/$name" -- --recurse-submodule
	cd "$name"
} && export -f clone

ssh() {
  command ssh "$@"
	echo -e "\033]6;1;bg;*;default\a"
} && export -f ssh

is_ssh() {
  [ -n "$SSH_CONNECTION" ]; or [ -n "$SSH_CLIENT" ]; or [ -n "$SSH_TTY" ]
} && export -f is_ssh

is_tmux() {
  [ -n "$TMUX" ]
} && export -f is_tmux

grep_highlight() {
  grep --color=always -E "$1|\$" "$2";
} && export -f grep_highlight

# ------------- source external dependencies / completion ------------

# for mac
#[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
_have brew && [[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && \
    . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

owncomp=(
	pdf kn yt gl auth pomo config live iam sshkey ws x clip
	./build build b ./k8sapp k8sapp ./setup ./cmd run ./run
	foo ./foo cmds ./cmds openapi
)

for i in "${owncomp[@]}"; do complete -C "$i" "$i"; done

_have gh && . <(gh completion -s bash)
_have glow && . <(glow completion  bash)
_have goreleaser && . <(goreleaser completion bash 2>/dev/null)
_have klogin && . <(klogin completion bash 2>/dev/null)
_have pandoc && . <(pandoc --bash-completion)
_have kubectl && . <(kubectl completion bash 2>/dev/null)
#_have clusterctl && . <(clusterctl completion bash)
_have k && complete -o default -F __start_kubectl k
_have kind && . <(kind completion bash)
_have kompose && . <(kompose completion bash)
_have helm && . <(helm completion bash)
_have minikube && . <(minikube completion bash)
_have conftest && . <(conftest completion bash)
_have mk && complete -o default -F __start_minikube mk
_have podman && _source_if "$HOME/.local/share/podman/completion" # d
_have docker && _source_if "$HOME/.local/share/docker/completion" # d
_have docker-compose && complete -F _docker_compose dc            # dc

_have ansible && . <(register-python-argcomplete3 ansible)
_have ansible-config && . <(register-python-argcomplete3 ansible-config)
_have ansible-console && . <(register-python-argcomplete3 ansible-console)
_have ansible-doc && . <(register-python-argcomplete3 ansible-doc)
_have ansible-galaxy && . <(register-python-argcomplete3 ansible-galaxy)
_have ansible-inventory && . <(register-python-argcomplete3 ansible-inventory)
_have ansible-playbook && . <(register-python-argcomplete3 ansible-playbook)
_have ansible-pull && . <(register-python-argcomplete3 ansible-pull)
_have ansible-vault && . <(register-python-argcomplete3 ansible-vault)
#_have ssh-agent && test -z "$SSH_AGENT_PID" && . <(ssh-agent)

# -------------------- personalized configuration --------------------

_source_if "$HOME/.bash_personal"
_source_if "$HOME/.bash_private"
_source_if "$HOME/.bash_work"

_have terraform && complete -C /usr/bin/terraform terraform
_have terraform && complete -C /usr/bin/terraform tf
