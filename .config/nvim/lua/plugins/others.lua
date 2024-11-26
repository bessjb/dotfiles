return {
  'tpope/vim-fugitive',
  'ThePrimeagen/vim-be-good',
  {
    "quarto-dev/quarto-nvim",
    ft={'markdown', 'quarto'},
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('quarto').setup{
        lspFeatures = {
          enabled = true,
          languages = {'python'},
          diagnostics = {
            enabled = true,
            triggers = { "BufWrite" }
          },
          completion = {
            enabled = true
          }

        },
        codeRunner = {
          enabled = false,
          default_method = 'molten',
          ft_runners = { python = "molten" },
        },
      }
      local runner = require("quarto.runner")
      vim.keymap.set("n", "<leader>rc", runner.run_cell,  { desc = "run cell", silent = true })
      vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", silent = true })
      vim.keymap.set("n", "<leader>rA", runner.run_all,   { desc = "run all cells", silent = true })
      vim.keymap.set("n", "<leader>rl", runner.run_line,  { desc = "run line", silent = true })
      vim.keymap.set("v", "<leader>r",  runner.run_range, { desc = "run visual range", silent = true })
      vim.keymap.set("n", "<leader>RA", function()
        runner.run_all(true)
      end, { desc = "run all cells of all languages", silent = true })
    end
  },
  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  }

}

