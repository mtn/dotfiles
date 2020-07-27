{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;

    shellAliases = {
      cl = "clear";
      wo = "cd $HOME/Documents/workspace";
      q = "exit";
      e = "nvim";
      g = "git";
    };
  };

  programs.tmux = {
    enable = true;

    extraConfig = ''
      unbind C-b
      set-option -g prefix C-x
      bind C-x send-prefix
      set-option -g prefix2 C-a

      set -g status-fg blue
      set -g status-bg black

      bind r source-file ~/.tmux.conf \; display-message "Configuration reloaded."

      # Window separator
      set -g window-status-separator " "

      set -s escape-time 0

      set -g status on

      set -g default-terminal "screen-256color"

      bind Escape copy-mode

      # Use vim keybindings in copy mode
      setw -g mode-keys vi
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -sel clip -i'

      bind c new-window -c "#{pane_current_path}"
      bind i split-window -h -c "#{pane_current_path}"
      bind e split-window -v -c "#{pane_current_path}"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -n M-Left resize-pane -L
      bind -n M-Right resize-pane -R
      bind -n M-Up resize-pane -U
      bind -n M-Down resize-pane -D

      bind b break-pane

      set-option -g status-interval 1

      set -g status-left ""
      set -g status-right "#([ $(tmux show-option -qv key-table) = 'off' ] && echo 'OFF') [#S] #[bold] %m/%d #[bold] %H:%M "
    '';
  };

  programs.neovim = {
    enable = true;

    extraConfig = ''
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

      set clipboard+=unnamed,unnamedplus

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

      " Color scheme {
        " set background=light
        " colorscheme cosmic_latte
        colorscheme despacio
        " color alduin
        set background=dark
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
      let g:ctrlp_map = '<C-p>'
      let g:ctrlp_cmd = 'CtrlPMixed'
      map <leader>q :CtrlPTag<CR>
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
      " let g:rooter_patterns = ['Cargo.toml', '.git/']
      " let g:rooter_silent_chdir = 1
      " }

      " nerdtree
      " {
      map <C-n> :NERDTreeToggle<CR>
      " }

      " coc
      " {
      set updatetime=300
      set shortmess+=c
      "}

      " semshi
      " {
      let g:semshi#update_delay_factor = 0.0001
      " }

      autocmd FileType python nnoremap <buffer> <C-l> :exec '!python3' shellescape(@%, 1)<cr>
      autocmd FileType javascript nnoremap <buffer> <C-l> :exec '!node' shellescape(@%, 1)<cr>
      autocmd FileType c nnoremap <buffer> <C-l> :exec '!gcc' shellescape(@%, 1) '&& ./a.out && rm a.out'<cr>
      autocmd FileType rust nnoremap <buffer> <C-l> :exec '!cargo run'<cr>
      autocmd FileType rust nnoremap <buffer> <C-b> :exec '!cargo test'<cr>
      autocmd FileType html nnoremap <buffer> <C-l> :exec '!open' shellescape(@%, 1)<cr>
      autocmd FileType markdown nnoremap <buffer> <C-l> :exec '!mdcat' shellescape(@%, 1)<cr>
    '';

    plugins = let customPlugins = {
      Despacio = pkgs.vimUtils.buildVimPlugin {
        name = "Despacio-git-07-01-2020";
        src = pkgs.fetchgit {
          url = "https://github.com/AlessandroYorba/Despacio.git";
          rev = "d214f8424a97ca35f8c74fbd7e8968326585165c";
          sha256 = "16cn1x4as0x2855zrhhz3b8x65rmm752s203sbl6zddc7bl15gmb";
        };
      };

      vim-buftabline = pkgs.vimUtils.buildVimPlugin {
        name = "vim-buftabline-git-10-18-2019";
        src = pkgs.fetchgit {
          url = "https://github.com/ap/vim-buftabline.git";
          rev = "d9a75fe730921426eff7311cd1390ec628ede9d5";
          sha256 = "0cd9rc7cm2r9id9wlbryqwp7pwcja8pk90nw0vakdh9ja4qjq2rw";
        };
      };

      vim-search-pulse = pkgs.vimUtils.buildVimPlugin {
        name = "vim-search-pulse-git-01-05-2017";
        src = pkgs.fetchgit {
          url = "https://github.com/inside/vim-search-pulse.git";
          rev = "9f8f473e3813bd76ecb66e8d6182d96bda39b6df";
          sha256 = "1xr90a8wvjfkgw1yrh0zcvpvp9ma6z0wqkl8v8pabf20vckgy2q0";
        };
      };
    }; in with pkgs.vimPlugins // customPlugins; [
      vim-commentary
      vim-surround
      vim-abolish
      vim-fugitive
      vim-dispatch
      ale
      auto-pairs
      vim-pencil
      ctrlp-vim
      rainbow
      vimtex
      semshi
      nerdtree
      coc-nvim

      # Custom plugins
      Despacio
      vim-buftabline
      vim-search-pulse
    ];
  };
}
