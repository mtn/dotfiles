" Dein
set runtimepath+=~/.vim/bundle/dein.vim//repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundle/dein.vim/')
  call dein#begin('~/.vim/bundle/dein.vim/')

  call dein#add('~/.vim/bundle/dein.vim//repos/github.com/Shougo/dein.vim')

  " Plugins:
  call dein#add('scrooloose/nerdtree')" 

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
"End dein

scriptencoding utf-8
set background=dark
set showmode

set cursorline
set colorcolumn=90
set number
set relativenumber
set linespace=0
set showmatch

set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

set virtualedit=onemore 
set spell
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-

set hidden
set history=1000

set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nojoinspaces

set splitright
set splitbelow

