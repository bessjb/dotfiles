-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Tree sitter
  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- vim-be-good game
  use ( 'ThePrimeagen/vim-be-good')

  --- LSP zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  -- nvim-dap
  use 'mfussenegger/nvim-dap'

  -- rose-pine color
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  vim.cmd('colorscheme rose-pine')

end)

