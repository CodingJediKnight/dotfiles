#!/bin/sh

cd "$HOME"
curl -sSLO https://raw.githubusercontent.com/CodingJediKnight/dotfiles/main/.inputrc
curl -sSLO https://raw.githubusercontent.com/CodingJediKnight/dotfiles/main/.dircolors
curl -sSLO https://raw.githubusercontent.com/CodingJediKnight/dotfiles/main/.profile
cp .profile .bash_profile
curl -sSLO https://raw.githubusercontent.com/CodingJediKnight/dotfiles/main/install/windows/.bashrc

curl -sSLO https://raw.githubusercontent.com/CodingJediKnight/dotfiles/main/vim/.vimrc
mkdir "$HOME/.vim/" "$HOME/.vim/autoload" "$HOME/.vim/spell"
cd "$HOME/.vim/autoload"
curl -sSLO https://raw.githubusercontent.com/CodingJediKnight/dotfiles/main/vim/.vim/autoload/plug.vim
