-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  requires = { {'nvim-lua/plenary.nvim'},
               -- FZF for Telescope
               {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'},
             }
  }

  -- Fugitive
  use 'tpope/vim-fugitive'

  -- Tree sitter
  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- vim-be-good game
  use ( 'ThePrimeagen/vim-be-good')

  -- LSP Support
  use {'neovim/nvim-lspconfig'}
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}

  -- Autocompletion
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'saadparwaiz1/cmp_luasnip'}
  use {'L3MON4D3/LuaSnip'}

  -- rose-pine color
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  vim.cmd('colorscheme rose-pine')

end)

