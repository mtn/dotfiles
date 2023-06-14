vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
      'AlessandroYorba/Despacio',
      as = 'despacio',
      config = function()
          vim.cmd('colorscheme despacio')
      end
  }

  use {
     'nvim-treesitter/nvim-treesitter',
     run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
     end

  }

  use('mbbill/undotree')

  use('tpope/vim-fugitive')
  use('tpope/vim-commentary')
  use{'tpope/vim-surround'}

  use{'ap/vim-buftabline'}

  use{'jiangmiao/auto-pairs'}

  use{'luochen1990/rainbow'}

  use{'inside/vim-search-pulse'}

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

end)
