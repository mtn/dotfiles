vim.g.mapleader = ","

local isNetrwOpen = false
function ToggleNetrw()
  if isNetrwOpen then
    vim.cmd(":Rexplore")
    isNetrwOpen = false
  else
    vim.cmd(":Explore")
    isNetrwOpen = true
  end
end
vim.api.nvim_set_keymap('n', '<leader>vp', ':lua ToggleNetrw()<CR>', { silent = true })

vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', ';;', ';', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>v', '<C-V>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>d', ':bp<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':bn<cr>', { noremap = true })


vim.opt.guicursor = ""

vim.opt.mouse = ""
vim.opt.mousehide = true
vim.opt.showmode = true

vim.opt.colorcolumn = "90"
vim.opt.number = true
vim.opt.cursorline = false
vim.opt.relativenumber = true
vim.opt.linespace = 0
vim.opt.smarttab = true
vim.opt.showmatch = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.virtualedit = "onemore"

vim.opt.iskeyword:remove('.')
vim.opt.iskeyword:remove('#')
vim.opt.iskeyword:remove('-')

vim.opt.hidden = true
vim.opt.history = 10000
vim.opt.backspace = "indent,eol,start"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.whichwrap = "b,s,h,l,<,>,[,]"
vim.opt.scrolljump = 5
vim.opt.scrolloff = 3
vim.opt.foldenable = true
vim.opt.list = true

vim.opt.listchars = {
  trail = '•',
  tab = '›\\ ',
  extends = '#',
  nbsp = '.'
}

vim.opt.clipboard:append{"unnamed", "unnamedplus"}

vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.joinspaces = false
vim.opt.autoindent = true
vim.opt.spell = false

vim.cmd("colorscheme despacio")
vim.opt.background = "dark"

vim.api.nvim_exec([[
  augroup MyAutoCommands
    autocmd!
    autocmd FileType puppet,yml setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType latex,tex,md,markdown,txt,text setlocal spell
  augroup END
]], false)

vim.opt.laststatus = 2
vim.opt.statusline = "%<%f "  -- Filename
vim.opt.statusline = vim.o.statusline .. "%w%h%m%r "  -- Options
vim.opt.statusline = vim.o.statusline .. "%=%-14.(%l,%c%V%) %p%%"  -- Right aligned file nav info

local undodir = vim.fn.expand("~/.config/nvim/undo")  -- expand path
-- Check if undodir exists, if not, create it
if vim.fn.isdirectory(undodir) == 0 then
    os.execute("mkdir -p " .. undodir)
end
-- Set the undodir and undofile options
vim.opt.undodir = undodir
vim.opt.undofile = true

vim.cmd [[
    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
]]


function TrimSpaces()
  vim.api.nvim_exec([[
    if !&binary && &filetype != 'diff'
      normal mz
      normal Hmy
      %s/\s\+$//e
      normal 'yz<CR>
      normal `z
    endif
  ]], false)
end
vim.api.nvim_command('command! -bar -nargs=0 TrimSpaces call luaeval("TrimSpaces()")')
