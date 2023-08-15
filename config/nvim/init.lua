-- General Config Files (./lua)
require "keymap"
require "settings"

-- Gruvbox colorscheme
vim.g.gruvbox_material_background = "hard"
vim.cmd("colorscheme gruvbox-material")

-- Vimwiki Settings
-- vim.g.vimwiki_list = {{
--   path = '~/vimwiki/',
--   syntax = 'markdown',
--   ext = '.md'
-- }}
-- vim.g.vimwiki_global_ext = 0

-- Plugin Files
require('plugins.telescope')
require('plugins.lspconfig')

-- Require lines
require('gitsigns').setup()
require('which-key').setup()
require('copilot').setup()
require('lualine').setup({
  options = {
    theme = 'gruvbox-material'
  }
})
require('neoscroll').setup({
  easing_function = "quadratic"
})
require('nvim-autopairs').setup()
require('nvim-ts-autotag').setup()
