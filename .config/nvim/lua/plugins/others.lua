return {
  'tpope/vim-fugitive',
  'ThePrimeagen/vim-be-good',
  'nvim-treesitter/playground',
  'bessjb/zotero-importer.nvim',
  config = function()
    local zotero = require('zotero')
    vim.keymap.set('n', '<leader>zb', zotero.update_bib_from_buffer, {})
  end,
}

