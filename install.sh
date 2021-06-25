#!/bin/bash -e

# Installs Optixal's neovim-init.vim into ~/.config/nvim/init.vim. Intended for Ubuntu/Debian. I highly recommend running the following commands manually, especially if you are running macOS or other Linux distros. For macOS, use homebrew instead of apt.

# Make config directory for Neovim's init.vim
echo '[*] Preparing Neovim config directory ...'
mkdir -p ~/.config/nvim

# Install nvim (and its dependencies: pip3, git), Python 3 and ctags (for tagbar)
echo '[*] App installing Neovim and its dependencies (Python 3 and git), and dependencies for tagbar (exuberant-ctags) ...'
sudo apt update
sudo apt install neovim python3 python3-pip python3-venv git curl exuberant-ctags -y

# Install Node.js v16.x (for Ubuntu) for coc.vim
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

# Install The Silver Searcher (ag), ripgrep (rg) and bat for fzf.vim
sudo apt install -y silversearcher-ag
sudo apt install -y -o Dpkg::Options::="--force-overwrite" bat ripgrep # https://github.com/sharkdp/bat/issues/938

# Install vim-plug plugin manager
echo '[*] Downloading vim-plug, the best minimalistic vim plugin manager ...'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create a backup of your current init.vim if you have one
if [ -f ~/.config/nvim/init.vim ]; then
    echo '[*] Backing up existing init.vim'
    cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup
fi

# Enter Neovim and install plugins with vim-plug's :PlugInstall and coc extensions with CoC's :CocInstall using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
echo -e '[*] Running :PlugInstall within nvim ...'
sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim
nvim -c 'PlugInstall' -c 'qa'
rm ~/.config/nvim/init.vim

# Copy init.vim in current working directory to nvim's config location ...
echo '[*] Copying init.vim -> ~/.config/nvim/init.vim'
cp init.vim ~/.config/nvim/

echo -e "[+] Done, welcome to your new \033[1m\033[92mNeovim\033[0m experience! Try it by running: nvim/vim. Want to customize it? Modify ~/.config/nvim/init.vim! Remember to change your terminal font to Iosevka Term Regular, or any other preferred nerd font :)"
