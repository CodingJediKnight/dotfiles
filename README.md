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
chsh -s (which fish)
```
### Entr
```bash
entr bash -c 'clear; go run /tmp/main.go' <<< /tmp/main.go
```
## Mentioning
### Used repos
* https://github.com/rwxrob/dot
* https://github.com/imposibrus/dotfiles
