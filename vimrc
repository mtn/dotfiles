" Dein {
    set runtimepath+=~/.vim/bundle/dein.vim//repos/github.com/Shougo/dein.vim

    if dein#load_state('~/.vim/bundle/dein.vim/')
      call dein#begin('~/.vim/bundle/dein.vim/')

      call dein#add('~/.vim/bundle/dein.vim//repos/github.com/Shougo/dein.vim')

      " Plugins, etc.:
      call dein#add('scrooloose/nerdtree') 
      call dein#add('tpope/vim-commentary')
      call dein#add('vim-syntastic/syntastic')
      call dein#add('altercation/vim-colors-solarized')
      call dein#add('tpope/vim-fugitive')

      call dein#source('vim-colors-solarized')
      call dein#end()
      call dein#save_state()
    endif

    filetype plugin indent on
    syntax enable

    if dein#check_install()
      call dein#install()
    endif
" }

scriptencoding utf-8
set shell=/bin/sh
set background=dark
set mousehide
set showmode

set backup                  " Backups are nice ...
set undofile                " So is persistent undo ...
set undodir="$HOME/.VIM_UNDO_FILES"
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

set cursorline
set colorcolumn=90
set number
set relativenumber
set linespace=0
set smarttab
set showmatch

set hlsearch
set incsearch                   " Find as you type search
nnoremap <silent> <Enter> :nohlsearch<Bar>:echo<CR>

set virtualedit=onemore 
set spell
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-

set hidden
set history=1000
set backspace=indent,eol,start
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable
set listchars=trail:•,tab:›\ ,extends:#,nbsp:. " Whitespace, etc.
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nojoinspaces
set autoindent

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell

set splitright
set splitbelow

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    color solarized
endif

" highlight clear SignColumn      " SignColumn should match background

 if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
endif

if has('statusline')
    set laststatus=2
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

let mapleader = ','


" NerdTree {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
      map <C-e> :NERDTreeToggle<CR>
      
      let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
      let NERDTreeShowHidden=1
      let NERDTreeQuitOnOpen=1
      let NERDTreeShowBookmarks=1
    endif
" }

