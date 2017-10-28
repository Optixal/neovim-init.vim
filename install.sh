#!/bin/bash

# Install nvim, pip3 and git
echo '[*] App installing Neovim and its dependencies (Python 3 and git) ...'
sudo apt install neovim python3-pip git &&\

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

# (Optional but recommended) Install a nerd font for icons and a beautiful airline bar (https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts) (I'm using Roboto Mono Nerd Font Complete) (remember to change terminal font to Roboto Mono, or whichever patched font you've picked!)
echo "[*] Downloading patch font into $(readlink -f ~/.local/share/fonts), remember to select 'Roboto Mono' as your font ..."
curl -fLo ~/.local/share/fonts/Roboto\ Mono\ Nerd\ Font\ Complete.ttf --create-dirs https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf &&\

# (Optional) Alias vim -> nvim
echo '[*] Aliasing vim -> nvim, remember to source ~/.bashrc ...'
echo "alias vim='nvim'" >> ~/.bashrc &&\

echo "[+] Done, enjoy Neovim! Don't forget to run :PlugInstall within nvim."
# Enter Neovim and install plugins
# nvim
# :PlugInstall
# :qa! # Quit All Force (no save). Useful when dealing with multiple split windows.
