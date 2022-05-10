#!/bin/bash

# Install solidity compiler for Ubuntu
# https://docs.soliditylang.org/en/v0.8.13/installing-solidity.html
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install solc

# Language Server: Add 'solc' to servers array in init.vim

# Grammar: Run ':TSInstall solidity' in nvim

# Formatter: In your package, run the following
# npm install --save-dev prettier prettier-plugin-solidity

# Mapping for Formatter: Add this to init.vim
# autocmd Filetype solidity nmap <leader>p :0,$!npx prettier %<CR>

