-- local lspconfig = require "mason"

return {
  ensure_installed = {
-- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    --python stff
    "black",
    "debugpy",
    "mypy",
    "ruff",
    "pyright",

    --golang stff
    "gopls",
    "gofumpt",
    "delve",
    "revive",
    "golines",
    "goimports-reviser",
  }
}
