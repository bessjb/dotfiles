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
        },
        textobjects = {
            move = {
                enable = true,
                set_jumps = false, -- you can change this if you want.
                goto_next_start = {
                    --- ... other keymaps
                    ["]b"] = { query = "@code_cell.inner", desc = "next code block" },
                },
                goto_previous_start = {
                    --- ... other keymaps
                    ["[b"] = { query = "@code_cell.inner", desc = "previous code block" },
                },
            },
            select = {
                enable = true,
                lookahead = true, -- you can change this if you want
                keymaps = {
                    --- ... other keymaps
                    ["ib"] = { query = "@code_cell.inner", desc = "in block" },
                    ["ab"] = { query = "@code_cell.outer", desc = "around block" },
                },
            },
            swap = { -- Swap only works with code blocks that are under the same
                     -- markdown header
                enable = true,
                swap_next = {
                    --- ... other keymap
                    ["<leader>sbl"] = "@code_cell.outer",
                },
                swap_previous = {
                    --- ... other keymap
                    ["<leader>sbh"] = "@code_cell.outer",
                },
            },
        }
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
}
        -- ... other ts config
