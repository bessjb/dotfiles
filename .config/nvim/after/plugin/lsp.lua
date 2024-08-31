local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'clangd',
  'lua_ls',
  'pyright',
  'texlab',
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.definitionProvider then
      vim.keymap.set("n", "<leader>gd", function()
        vim.lsp.buf.definition()
      end)
    end
    if client.server_capabilities.renameProvider then
      vim.keymap.set("n", "<leader>R", function()
        vim.lsp.buf.rename()
      end)
    end
    if client.server_capabilities.codeActionProvider then
      vim.keymap.set("n", "<leader>a", function()
        vim.lsp.buf.code_action()
      end)
    end
  end
})

local opts = { noremap=true, silent=true }

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, opts)

vim.keymap.set("n", "<leader>gh", function() vim.api.nvim_command("ClangdSwitchSourceHeader") end)

lsp.setup()

