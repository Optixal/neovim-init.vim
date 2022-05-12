#!/bin/bash -e

# "Convenience" Install Script for Optixal's neovim-init.vim

# Installs neovim and all necessary dependencies for Optixal's neovim-init.vim. Does not check if dependencies have already been installed. Highly recommended to go through each command and run them manually instead of using this convenience script, especially if you are running macOS or other Linux distros. For macOS, use homebrew instead of apt.

# Vars used when downloading and installing neovim and dependencies
NEOVIM_VERSION=0.7.0
NVM_VERSION=0.39.1
NODE_VERSION=18.0.0

# Check if this script is being run in the "convenience" directory
if ! [[ "$PWD" = */convenience ]]; then
    echo '[-] Please run the installation script within the "convenience" directory: cd convenience && ./install.sh'
    exit 1
fi

# Check if existing nvim config is present
if [ -f ~/.config/nvim/init.vim ] || [ -f ~/.config/nvim/init.lua ]; then
    echo '[-] Existing nvim init config file found in ~/.config/nvim/. Please backup or remove it first before running this script.'
    exit 1
fi

# Make config directory for Neovim's init.vim
echo '[*] Preparing Neovim config directory ...'
mkdir -p ~/.config/nvim

echo '[*] Installing dependencies ...'
# Installs the following dependencies:
#  * wget (for downloading neovim package)
#  * curl (for installing vim-plug)
#  * git (for vim-plug itself)
#  * build-essential (or gcc for mac) (for nvim-treesitter's TSInstall and telescope-fzf-native's initial make)
#  * ripgrep (for telescope)
#  * python3 (and python3-pip and python3-venv for linux) (for Python 3 capabilities, e.g. pynvim and doq python docstrings)
if [[ "$OSTYPE" = "darwin"* ]]; then
    brew install \
        wget \
        curl \
        git \
        gcc \
        ripgrep \
        python3
else
    sudo apt update
    sudo apt install \
        wget \
        curl \
        git \
        build-essential \
        ripgrep \
        python3 \
        python3-pip \
        python3-venv \
        -y
fi

# Install neovim
echo "[*] Installing neovim $NEOVIM_VERSION ..."
wget "https://github.com/neovim/neovim/releases/download/v$NEOVIM_VERSION/nvim-linux64.tar.gz" -O /tmp/nvim-linux64.tar.gz
mkdir -p ~/.local/bin
tar xf /tmp/nvim-linux64.tar.gz -C ~/.local
ln -sf $(readlink -f ~/.local/nvim-linux64/bin/nvim) ~/.local/bin/nvim

# Add ~/.local/bin to PATH if it's not already in it
if ! [[ ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
    echo "[*] Adding ~/.local/bin to PATH"
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        SHELL_CONFIG_FILE=~/.zshrc
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        SHELL_CONFIG_FILE=~/.profile
    else
        echo "[-] Could not detect what shell you are using. Ensure to manually add ~/.local/bin to your PATH"
    fi
    echo -e '\nPATH="$HOME/.local/bin:$PATH"' >> $SHELL_CONFIG_FILE
    export PATH="$HOME/.local/bin:$PATH"
fi

# Install nvm, node, npm, language servers
echo "[*] Installing nvm $NVM_VERSION ..."
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh" | bash # installs Node Version Manager to ~/.nvm, it also detects bash or zsh and appends source lines to ~/.bashrc or ~/.zshrc accordingly
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # to get the nvm command working without sourcing bash configs
echo "[*] Installing node $NODE_VERSION ..."
nvm install $NODE_VERSION # installs specific version of Node
echo "[*] Setting npm config to use ~/.local as prefix ..."
npm config set prefix '~/.local/' # npm install -g will now install to ~/.local/bin
echo "[*] Installing language servers ..."
npm i -g pyright # python language server
#npm i -g typescript typescript-language-server # uncomment to install typescript language server. remember to add "tsserver" to the "servers" list in init.vim within the lua section. See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for other language servers.

# Install virtualenv to containerize dependencies for vim-pydocstring (doq) and formatting feature (pynvim for black plugin)
echo '[*] Installing Python dependencies in a virtual environment ...'
python3 -m venv ~/.config/nvim/env
source ~/.config/nvim/env/bin/activate
pip install wheel
pip install pynvim doq
deactivate

# Install vim-plug plugin manager
echo '[*] Installing vim-plug'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Enter Neovim and install plugins with vim-plug's :PlugInstall using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
echo -e '[*] Running :PlugInstall within nvim ...'
sed '/call plug#end/q' ../init.vim > ~/.config/nvim/init.vim
nvim -c 'PlugInstall' -c 'qa'

# Copy init.vim and lua scripts in current working directory to nvim's config location
echo '[*] Copying init.vim & lua/ -> ~/.config/nvim/'
cp -r ../init.vim ../lua/ ~/.config/nvim/

echo -e "[+] Done, welcome to your new \033[1m\033[92mneovim\033[0m experience! Try it by running: nvim. (NOTE, remember to: source $SHELL_CONFIG_FILE) Want to customize it? Modify ~/.config/nvim/init.vim! Remember to change your terminal font to a nerd font :)"
