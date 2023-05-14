local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'clangd',
  'lua_ls',
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.definitionProvider then
      vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end)
    end
  end
})


vim.keymap.set("n", "<leader>gh", function() vim.api.nvim_command("ClangdSwitchSourceHeader") end)

lsp.setup()

