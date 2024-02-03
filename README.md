# Dot Files
Personal .files and config repo

## Install
```bash
mkdir -p "$HOME/code/reps/github.com/CodingJediKnight/" && cd "$_"
git clone https://github.com/CodingJediKnight/dotfiles.git && cd dotfiles
./setup 
```

## Features
### Pomo
Pomo timer in tmux session
```bash
go install github.com/rwxrob/pomo/cmd/pomo@latest
pomo init
pomo delete interval
pomo start
```
### Fish
```bash
sudo apt install fish
./fish/setup
set --universal fish_user_paths ~/.local/bin $fish_user_paths
chsh -s (which fish)
```
### Entr
Cool things
```bash
entr bash -c 'clear; go run /tmp/main.go' <<< /tmp/main.go
```
### Mods
Check mods config file path first with `mods --settings`
```bash
yq -i '
  .temp = 0.7 |
  .topp = 0.7 |
  .max-input-chars = 24500 |
  .max-tokens = 2048 |
  .apis.cjk-gpt.base-url = "localhost:5000/v1" |
  .apis.cjk-gpt.models.gpt.max-input-chars = 24500
' ~/.config/mods/mods.yml
```

## Mentioning
### Used repos
* https://github.com/rwxrob/dot
* https://github.com/imposibrus/dotfiles
