-- Open the file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remap J so that curser stays in the same place
vim.keymap.set("n", "J", "mzJ`z")

-- Paste witout overwriting buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Open the file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remap J so that curser stays in the same place
vim.keymap.set("n", "J", "mzJ`z")

-- Paste witout overwriting buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>b', vim.diagnostic.goto_next)

vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-n>')
