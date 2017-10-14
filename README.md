# Optixal's Neovim init.vim

![Neovim Screenshot](screenshot.png)

## Installation

```sh
# Install nvim, pip3 and git
sudo apt install nvim python3-pip git

# Install pip modules for Neovim
pip3 install --user neovim jedi psutil setproctitle

# Install vim-plug plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install powerline fonts for a beautiful airline bar (remember to change terminal font to a powerline font!)
git clone https://github.com/powerline/fonts /tmp/powerline-fonts
/tmp/powerline-fonts/install.sh
rm -rf /tmp/powerline-fonts

# Make config directory for Neovim's init.vim
mkdir -p ~/.config/nvim

# Soft link the init.vim in current working directory to config's one
ln -s init.vim ~/.config/nvim/init.vim

# Enter Neovim and install plugins
nvim
:PlugInstall
:qa!
```

