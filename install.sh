#!/bin/bash

# Install nvim (and its dependencies: pip3, git) and ctags (for tagbar)
echo '[*] App installing Neovim and its dependencies (Python 3 and git), and dependencies for tagbar (exuberant-ctags) ...'
sudo apt install neovim python3-pip git exuberant-ctags -y &&\

# Install pip modules for Neovim
echo '[*] Pip installing Neovim (for Python plugin support) and libraries for async autocompletion support (jedi, psutil, setproctitle) ...'
pip3 install --user neovim jedi psutil setproctitle &&\

# Install vim-plug plugin manager
echo '[*] Downloading vim-plug, the best minimalistic vim plugin manager ...'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&\

# Make config directory for Neovim's init.vim
echo '[*] Preparing Neovim config directory ...'
mkdir -p ~/.config/nvim &&\

# Soft link the init.vim in current working directory to nvim's config location. Or simply `cp init.vim ~/.config/nvim/`
echo "[*] Soft-linking $(readlink -f init.vim) -> $(readlink -f ~/.config/nvim/init.vim)"
ln -sf $(readlink -f init.vim) ~/.config/nvim/. &&\

# (Optional but recommended) Install a nerd font for icons and a beautiful airline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) (I'll be using Roboto Mono for Powerline)
echo "[*] Downloading patch font into ~/.local/share/fonts ..."
curl -fLo ~/.local/share/fonts/Roboto\ Mono\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf &&\

# (Optional) Alias vim -> nvim
echo '[*] Aliasing vim -> nvim, remember to source ~/.bashrc ...'
echo "alias vim='nvim'" >> ~/.bashrc &&\

# Enter Neovim and install plugins
echo '[*] Running :PlugInstall within nvim.'
nvim -c ':PlugInstall'
echo "[+] Done, enjoy Neovim! Don't forget to run :PlugInstall within nvim."
