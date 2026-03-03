require("mason").setup()

-- Setup Mason LSP configuration
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'pyright', 'ts_ls' }, -- Specify the language servers you need
    automatic_enable = true,
})



