# Dot Files
Personal .files and config repo

## Install
### Init
```bash
mkdir -p "$HOME/code/repos/github.com/CodingJediKnight/" && cd "$_"
git clone https://github.com/CodingJediKnight/dotfiles.git && cd dotfiles
./setup
```
### Fresh Ubuntu
Install all:
```bash
dot && ./install/ubuntu/install-all
```
Or install per service:
```bash
dot && ./install/ubuntu/install-most-stuff-with-apt
# ./install/ubuntu/install-...
# ...
```
### Fresh macOS
Install all:
```bash
dot && ./install/mac/install-all
```
Or install per service:
```bash
dot && ./install/mac/install-most-stuff-with-brew
# ./install/mac/install-...
# ...
```
## Fish
Install:
```bash
brew install fish || sudo apt install fish
cd $DOTFILES/fish/ && ./setup
```
Then configure in fish terminal
```bash
cd $DOTFILES/fish/ && ./configure
```
### Font for fish
You need to install Hack font in your system and use to your terminal emu.
```bash
# MacOS
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
# Ubuntu
sudo apt install fontconfig
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
sudo mkdir /usr/local/share/fonts/Hack
sudo unzip Hack.zip -d /usr/local/share/fonts/Hack/
sudo fc-cache -fv
rm Hack.zip
# Windows
# Just download and install https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
```
## Features
### Vim
Don't forget to run
```bash
:PlugInstall
```
Install Russian spellcheck
```bash
:set spelllang=ru
```
### Pomo
Pomo timer in tmux session
```bash
go install github.com/rwxrob/pomo/cmd/pomo@latest
pomo init
pomo delete interval
pomo start
```
### Entr
Cool things
```bash
entr bash -c 'clear; go run /tmp/main.go' <<< /tmp/main.go
entr bash -c 'clear; go run RunOnAny$' < <(ls **/*.go)
```
### GPT (Mods)
Check mods config file path first with `mods --settings`

```bash
baseUrl="localhost:5000/v1"
```
```bash
yq -i '
  .temp = 0.7 |
  .topp = 0.7 |
  .max-input-chars = 24500 |
  .max-tokens = 2048 |
  .apis.cjk-gpt.base-url = "$baseUrl" |
  .apis.cjk-gpt.models.gpt.max-input-chars = 24500
' ~/.config/mods/mods.yml
```

## Mentioning
### Used repos
* https://github.com/rwxrob/dot
* https://github.com/imposibrus/dotfiles
