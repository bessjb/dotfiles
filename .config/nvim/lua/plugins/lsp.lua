return {
  -- LSP Support
  'neovim/nvim-lspconfig',
   event = { 'BufReadPre', 'BufReadPost', 'BufNewFile' },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
  },

  config = function()

    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities())

    require("mason").setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'clangd',
        'lua_ls',
        'texlab',
      },
      handlers = {
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
                capabilities = capabilities
            }
        end,
      }
    })

    vim.keymap.set("n", "<leader>gh", function() vim.api.nvim_command("ClangdSwitchSourceHeader") end)

    -- On attach
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
      callback = function(event)
        local opts = {buffer = event.buf}
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

        local client = vim.lsp.get_client_by_id(event.data.client_id)
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

    local cmp = require('cmp')
    cmp.setup({
        sources = cmp.config.sources({
          {
            name = 'nvim_lsp',
            entry_filter = function(entry, ctx)
              return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
            end
          }
        })
    })

  end
}

