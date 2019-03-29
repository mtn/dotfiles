" vim plug {
    call plug#begin('~/.vim/plugged')

      Plug 'tpope/vim-commentary'
      Plug 'tpope/vim-surround'
      Plug 'tpope/vim-abolish'
      Plug 'tpope/vim-fugitive'
      Plug 'tpope/vim-dispatch'
      Plug 'w0rp/ale'
      Plug 'ap/vim-buftabline'
      Plug 'jiangmiao/auto-pairs'
      Plug 'AlessandroYorba/Alduin'
      Plug 'reedes/vim-pencil'
      Plug 'ziglang/zig.vim'
      Plug 'ctrlpvim/ctrlp.vim'
      Plug 'luochen1990/rainbow'
      Plug 'inside/vim-search-pulse'
      Plug 'airblade/vim-rooter'
      Plug 'lervag/vimtex'
      Plug 'ambv/black', { 'on': 'Black' }

      Plug '/Users/michaelnoronha/Documents/workspace/python/misc/jupyterkernel.vim'
      " Plug '/Users/michaelnoronha/Documents/workspace/python/jupyter.vim/plugin/sample.vim'

      call plug#end()

    filetype plugin indent on
    set omnifunc=syntaxcomplete#Complete
    syntax enable
" }

" nvim specific settings
" {
set guicursor=
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
" }

scriptencoding utf-8
set shell=$SHELL
set background=dark
set mousehide
set showmode

set colorcolumn=90
set nonumber
set nocursorline
set norelativenumber " else slow :(
set linespace=0
set smarttab
set showmatch

set hlsearch
set incsearch                   " Find as you type search
nnoremap <silent> <Enter> :nohlsearch<Bar>:echo<CR>
noremap ; :
noremap ;; ;

set virtualedit=onemore
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-

set hidden
set history=10000
set backspace=indent,eol,start
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set infercase
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable
set list

if has('mac')
    set wildignorecase
endif

set listchars=trail:•,tab:›\ ,extends:#,nbsp:. " Whitespace, etc.
" if has('clipboard')
"     if has('unnamedplus')  " When possible use + register for copy-paste
"         set clipboard=unnamed,unnamedplus
"     else         " On mac and Windows, use * register for copy-paste
"         set clipboard=unnamed
"     endif
" endif

if $TMUX == ''
    set clipboard+=unnamed,unnamedplus
endif

au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

set shiftwidth=2
set expandtab
set tabstop=4
set softtabstop=4
set nojoinspaces
set autoindent
set nospell

let mapleader = ','

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

nnoremap <leader>v <C-V>

nnoremap <leader>d :bp<cr>
nnoremap <leader>f :bn<cr>

set pastetoggle=<leader>p
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

autocmd FileType puppet,yml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType latex,tex,md,markdown,txt,text setlocal spell

set splitright
set splitbelow

" Alduin {
    color alduin
" }

highlight clear SignColumn      " SignColumn should match background

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
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

    command! -bar -nargs=0 TrimSpaces <line1>,<line2>call TrimSpaces()
" }

" ale {
    let g:ale_lint_on_enter = 0
    noremap <leader>r :ALENextWrap<CR>
    noremap <leader>t :ALEPreviousWrap<CR>
    let g:ale_linters = {'tex': [], 'haskell': [], 'html': [], 'c': ['gcc'], 'cpp': ['gcc'], 'python': ['pylint']}
    let g:ale_set_highlights = 0
    let g:ale_enabled = 1
    let g:ale_completion_enabled = 1
    let g:ale_lint_on_save = 1
" }

" }

if has('statusline')
    set laststatus=2
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

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

" Restore cursor position
" {
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif
" }

" Ctrlp
" {
let g:ctrlp_map = '<C-t>'
" }

" vim-pencil
" {
let g:pencil#autoformat = 1
let g:pencil#hardwrap = 1
let g:pencil#textwidth = 80
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
  augroup END
" }

" vim-rooter
" {
let g:rooter_patterns = ['Cargo.toml', '.git/']
let g:rooter_silent_chdir = 1
" }


autocmd FileType python nnoremap <buffer> <C-l> :exec '!clear; python3' shellescape(@%, 1)<cr>
autocmd FileType tex nnoremap <buffer> <C-l> :exec '!clear; pdflatex' shellescape(@%, 1) '&& pdflatex' shellescape(@%, 1) '&& rm *.log && rm *.aux && open' shellescape(@%, 1)[1:-5] . 'pdf'<cr>
autocmd FileType javascript nnoremap <buffer> <C-l> :exec '!clear; node' shellescape(@%, 1)<cr>
autocmd FileType c nnoremap <buffer> <C-l> :exec '!clear; gcc' shellescape(@%, 1) '&& ./a.out && rm a.out'<cr>
autocmd FileType rust nnoremap <buffer> <C-l> :exec '!clear; cargo run'<cr>
autocmd FileType rust nnoremap <buffer> <C-b> :exec '!clear; cargo test'<cr>
autocmd FileType html nnoremap <buffer> <C-l> :exec '!open' shellescape(@%, 1)<cr>
autocmd FileType markdown nnoremap <buffer> <C-l> :exec '!clear; mdcat' shellescape(@%, 1)<cr>
