#!/bin/bash

# Install solidity compiler for Ubuntu
# https://docs.soliditylang.org/en/v0.8.13/installing-solidity.html
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install solc

# Language Server: Add 'solc' to servers array in init.vim

# Grammar: Run ':TSInstall solidity' in nvim

# Mapping for Formatter: Add this to init.vim
# autocmd Filetype solidity nmap <leader>p :0,$!npx prettier %<CR>


# In your project:

# Formatter: Prettier. In your package, run the following:
npm install --save-dev prettier prettier-plugin-solidity
# .prettierrc.json:
# {
#   "printWidth": 120
# }
# .prettierignore can follow .gitignore

# Linter: Solhint. In your package, run the following:
npm install --save-dev solhint solhint-plugin-prettier
npx solhint --init
# .solhint.json:
# {
#   "extends": "solhint:recommended",
#   "plugins": [],
#   "rules": {
#     "avoid-throw": "warn",
#     "avoid-suicide": "error",
#     "avoid-sha3": "warn"
#     "compiler-version": ["error", "^0.8.0"]
#   },
#   "plugins": ["prettier"]
# }
# .solhintignore can follow .gitignore
