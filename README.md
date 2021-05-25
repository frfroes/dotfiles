# Dotfiles
Intial workstation setup 🤖

## Setup

Clone dotfiles
```bash
git clone https://github.com/frenangomes/dotfiles
```

### NEOVIM
Install [vim-plug](https://github.com/junegunn/vim-plug)

Make sure that you have `~/.config/nvim/init.vim` and source this project's `init.vim` there:
```
source $HOME/<path-to-project>/dotfiles/vim/init.vim
```

```VIM
:PlugInstall
```

### TMUX

Install [tmux-plugins](https://github.com/tmux-plugins/tpm)

Make sure that you have `~/.tmux.conf` and source this project's `tmux.conf` there:

```bash
source $HOME/<path-to-project>/dotfiles/.tmux.conf
```

Install plugins with [tmux-plugins](https://github.com/tmux-plugins/tpm)

#### Cheatsheet
```
prefix + | -> split vertical
prefix + - -> split horizontal
prefix + z -> zoom panel
prefix + c -> create new panel
prefix + n -> switch between panel
```
