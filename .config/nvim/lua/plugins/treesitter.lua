return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = {
          'python',
          'cpp',
          'mermaid',
          'vim',
          'bash',
          'markdown'
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
}

