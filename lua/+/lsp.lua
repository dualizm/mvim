require("mason").setup()

local ensure_installed = { "lua_ls", "clangd" }
require("mason-lspconfig").setup({
  ensure_installed = ensure_installed
})

local capabilities = require"cmp_nvim_lsp".default_capabilities()

for _, server in pairs(ensure_installed) do
    require("lspconfig")[server].setup {
        on_attach = on_attach,
        capabilites = capabilities,
    }
end