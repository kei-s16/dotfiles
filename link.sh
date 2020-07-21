#!/bin/sh
mkdir ~/.zsh
mkdir -p ~/.config/nvim
mkdir ~/.eskk
mkdir ~/.lspServers

touch ~/.zsh/histfile
touch ~/.eskk/USER.L
curl http://openlab.jp/skk/skk/dic/SKK-JISYO.L -O > ~/.eskk/SKK-JISYO.L

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/neovim/nvimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/neovim/toml/dein.toml ~/.config/nvim/dein.toml
ln -sf ~/dotfiles/neovim/toml/dein_lazy.toml ~/.config/nvim/dein_lazy.toml
