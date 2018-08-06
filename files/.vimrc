"""""""""""""""""""""""
" File:   .vimrc
" Author: Adam Batten
" Year:   2018
"""""""""""""""""""""""
execute pathogen#infect()

""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""
" Don't be compatible with vi
set nocompatible

" Set how many lines for VIM to remember
set history=500

"""""""""""""""""""""""
" COLOURS
"""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

"try 
colorscheme monokai            " If monokai not installed use desert
"catch
"endtry

"set background=dark

""""""""""""""""""""""
" USER INTERFACE
""""""""""""""""""""""

" TAB Settings
set tabstop=4                      " Display the tabs as this many spaces
set softtabstop=4                  " The number of spaces a TAB is when editing
set expandtab                      " Tabs ARE spaces
set shiftwidth=4
set autoindent
set smartindent

" Display Settings
set ruler                          " Always show position
set showcmd                        " Show incomplete commands
set number                         " Line numbers efeef 

set backspace=indent,eol,start     " Backspace works like you would expect
set mouse=a                        " Enable mouse

" Disable Sound Errors
set vb
set noerrorbells
set novisualbell
set t_vb=
set tm=500

let mapleader = ","
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
