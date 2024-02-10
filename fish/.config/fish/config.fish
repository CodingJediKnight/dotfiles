#!/usr/bin/env fish

# settings for the "bobthefish" theme:
set -g theme_nerd_fonts yes
set -g theme_display_ruby no
set -g theme_display_virtualenv no
set -g theme_display_docker_machine no
set -g theme_display_vagrant no
set -g theme_display_k8s_context no
set -g theme_display_hg no
set -g theme_display_user no
set -g theme_display_node yes
set -g default_user jedi
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
set -g theme_title_display_process yes
set -g theme_show_exit_status yes
set -g theme_display_hostname yes

set -x BAT_STYLE "header-filename,header-filesize,grid"

# export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview;i:preview-tui'
# export NNN_FIFO=/tmp/nnn.fifo
[ -e ~/.aliases ]; and . ~/.aliases
alias temp='cd (mktemp -d)'
alias '\?\?'=gpt

type vim &>/dev/null && alias vi=vim

function ssh
	command ssh $argv
	echo -e "\033]6;1;bg;*;default\a"
end

function is_ssh
	[ -n "$SSH_CONNECTION" ]; or [ -n "$SSH_CLIENT" ]; or [ -n "$SSH_TTY" ]
end

function is_tmux
	[ -n "$TMUX" ]
end

function grep_highlight
	grep --color=always -E "$argv[1]|\$" $argv[2];
end

function save_history --on-event fish_preexec
    history --save
end

# local untracked staff
[ -e ~/.localrc ]; and . ~/.localrc
