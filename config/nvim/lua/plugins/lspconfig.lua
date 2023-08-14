-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.cssls.setup {}
lspconfig.html.setup {}
lspconfig.svelte.setup {}
lspconfig.nixd.setup {}
lspconfig.bashls.setup {}

-- Has additional configurations for neovim specific config support
require'lspconfig'.lua_ls.setup{
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = {
          globals = { 'vim' }
      }
    }
  }
}
