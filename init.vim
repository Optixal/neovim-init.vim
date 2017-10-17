""" Optixal's Neovim Init.vim

""" Vim-Plug
call plug#begin()

" Aesthetics
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'roxma/nvim-completion-manager'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/loremipsum'

call plug#end()

""" Coloring
syntax on
color dracula
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Opaque Background (Comment out to use terminal's profile)
set termguicolors

""" Other Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab smartindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set number relativenumber
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set title

""" Map Leader
let mapleader=","

""" Plugin Configurations

" NERDTree
nnoremap <leader>f :NERDTreeToggle<CR>

" Powerline
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''

" Neovim :Terminal
tnoremap <Esc> <C-\><C-n>

" Nvim Completion Manager
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" NERDTree
let NERDTreeShowHidden=1

""" Filetype-Specific Configurations

" HTML and Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

