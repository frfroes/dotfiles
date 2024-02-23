# Dotfiles
Initial workstation setup.

Follow these in order. When in doubt follow your heart ❤️ 👨‍💻

## Setup

Clone dotfiles
```bash
git clone https://github.com/frfroes/dotfiles
```

### CMD Checklist
- brew -> https://brew.sh/
- git -> https://git-scm.com/download/mac
- FZF -> https://github.com/junegunn/fzf
- jump -> https://github.com/gsamokovarov/jump
- fd -> https://github.com/sharkdp/fd
- ripgrep -> https://github.com/BurntSushi/ripgrep

### Iterm 2
Install [iterm2](https://formulae.brew.sh/cask/iterm2)

##### Theme
Download [Everforest theme](https://github.com/icewind/everforest.iterm2) for Iterm2, specifically the [dark low one].(https://github.com/icewind/everforest.iterm2/blob/main/themes/everforest_dark_low.itermcolors)

Install the theme as described [here](https://github.com/icewind/everforest.iterm2/tree/main?tab=readme-ov-file#install)

##### Fonts
Install [MesloLGS font(p10k required font)](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#manual-font-installation).

Install [FiraCode font](https://github.com/tonsky/FiraCode/wiki/Installing#macos).

Set up fonts:
 - Go to `Iterm2 -> Settings -> Profiles -> Text`
 - Add FiraCode as the main font (toggle ligatures)
 - Add MesloLGS as non-ASCII font
  <img width="568" alt="image" src="https://github.com/frfroes/dotfiles/assets/17256308/126a7c6f-3422-4665-b038-b18d4e0a24c5">



### Oh My ZSH 
Install [Oh My ZSH](https://github.com/ohmyzsh/ohmyzsh)

Install [p10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh)

Source the `~/.zshrc` and the `~/.zshenv` (might have to create) file to:
```bash
source $HOME/<path-to-project>/dotfiles/.zshrc
```

Source the `~/.p10k.zsh` file to:
```bash
source $HOME/<path-to-project>/dotfiles/.p10k.zsh
```

Restart the terminal.

### TMUX

Install [tmux-plugins](https://github.com/tmux-plugins/tpm)

Make sure that you have `~/.tmux.conf` and source it to:
```bash
source $HOME/<path-to-project>/dotfiles/.tmux.conf
```

Install plugins with [tmux-plugins](https://github.com/tmux-plugins/tpm)


##### Cheatsheet
```
prefix + | -> split vertical
prefix + - -> split horizontal
prefix + z -> zoom panel
prefix + c -> create new panel
prefix + n -> switch between panel
```

### NEOVIM
Install [vim-plug](https://github.com/junegunn/vim-plug)

Make sure that you have `~/.config/init.vim` and source it to:
```
source $HOME/<path-to-project>/dotfiles/vim/init.vim
```

- Install dependencies for[telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- Install [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating) and run `nvm install --lts` 

On nvim:
```VIM
:PlugInstall
```


