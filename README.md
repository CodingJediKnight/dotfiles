# Dot Files
Personal .files and config repo
## Install
```bash
mkdir -p "$HOME/code/reps/github.com/CodingJediKnight/" && cd "$_"
git clone https://github.com/CodingJediKnight/dotfiles.git
cd dotfiles
./setup 
```

## Features
### Pomo
```bash
go install github.com/rwxrob/pomo/cmd/pomo@latest
```
### Fish
```bash
sudo apt install fish
cd fish && ./setup
curl -L https://get.oh-my.fish | fish
set --universal fish_user_paths ~/.local/bin $fish_user_paths
chsh -s (which fish)
```
### Entr
```bash
entr bash -c 'clear; go run /tmp/main.go' <<< /tmp/main.go
```
### Mods
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
