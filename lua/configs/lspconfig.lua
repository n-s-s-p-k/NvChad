-- load defaults i.e lua_lsp
local nvlsp = require "nvchad.configs.lspconfig"

local lspconfig = require "lspconfig"

nvlsp.defaults()
-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "pyright",
  "yamlls",
  "gopls",
  "bashls",
  "terraformls",
  "solargraph",
  -- "elixirls",
  "lexical",
  "jdtls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- configuring single server, example: elixir-ls
-- lspconfig.elixirls.setup {
--   cmd = { "/Users/pniladhuri/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

lspconfig.lexical.setup {
  cmd = { "/Users/pniladhuri/.local/share/nvim/mason/packages/lexical/libexec/lexical/bin/start_lexical.sh" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
