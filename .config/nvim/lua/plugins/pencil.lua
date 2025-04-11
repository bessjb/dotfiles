return {
  "preservim/vim-pencil",
  init = function()
    vim.g["pencil#wrapModeDefault"] = "hard"
    vim.g["pencil#autoformat"] = 0
  end,
}
