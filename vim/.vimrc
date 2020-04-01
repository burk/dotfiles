call plug#begin('~/.vim/plugged')
Plug '/usr/share/doc/fzf/examples'
Plug 'junegunn/fzf.vim'
call plug#end()

set ruler
syntax on
set nocompatible
set pastetoggle=<F10>
set showmatch
set ignorecase
set incsearch
set number
set modeline
set nojoinspaces
set mouse=r
filetype plugin indent on
match Error /[\x7f-\xff]/ 
set clipboard=unnamed
set mouse=

