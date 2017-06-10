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
      call dein#add('Shougo/vimproc.vim',{'build' : 'make'})
      call dein#add('tpope/vim-fugitive')
      call dein#add('Valloric/YouCompleteMe',{'build': './install.py'})
      call dein#add('vim-scripts/restore_view.vim')
      call dein#add('mhinz/vim-signify')
      call dein#add('Xuyuanp/nerdtree-git-plugin')
      call dein#add('vim-airline/vim-airline')
      call dein#add('vim-airline/vim-airline-themes')
      call dein#add('jiangmiao/auto-pairs')
      call dein#add('tpope/vim-surround')
      call dein#add('dhruvasagar/vim-table-mode')
      call dein#add('easymotion/vim-easymotion')

      call dein#add('eagletmt/ghcmod-vim')
      call dein#add('rust-lang/rust.vim')

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
set shell=/bin/zsh
set background=dark
set mousehide
set showmode

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
set list
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

let mapleader = ','

let g:ycm_show_diagnostics_ui = 0
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell

set splitright
set splitbelow

""Dynamically resize active window
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

map <leader>a :bp<cr>
map <leader>f :bn<cr>

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    let g:solarized_termcolors=16777216
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    color solarized
endif

highlight clear SignColumn      " SignColumn should match background

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

if has('gui_running')
    set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h13
endif

" Trailing Whitespace {
    function TrimSpaces()
      if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<CR>
        normal `z
      endif
    endfunction

    command -bar -nargs=0 TrimSpaces <line1>,<line2>call TrimSpaces()
" }

" NerdTree {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
      map <C-e> :NERDTreeToggle<CR>

      let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
      let NERDTreeShowHidden=1
      let NERDTreeQuitOnOpen=1
      let NERDTreeShowBookmarks=1
    endif
" }

" vim-airline {
    if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
      if !exists('g:airline_theme')
        let g:airline_theme = 'solarized'
      endif
      let g:airline_powerline_fonts = 1
      let g:airline#extensions#tabline#enabled = 1
    endif
" }

" Syntastic Checkers {
    let g:syntastic_rust_checkers = ['rustc']
    let g:syntastic_javascript_checkers = ['jshint', 'jslint']
" }

" Persistent Undo {
    let vimDir = '$HOME/.vim'
    let &runtimepath.=','.vimDir

    " Keep undo history across sessions by storing it in a file
    if has('persistent_undo')
        let undoDir = expand(vimDir . '/undodir')
        " Create dirs
        call system('mkdir ' . vimDir)
        call system('mkdir ' . undoDir)
        let &undodir = undoDir
        set undofile
    endif
" }

