-- General Config Files (./lua)
require "keymap"
require "settings"

-- Gruvbox colorscheme
vim.g.gruvbox_material_background = "hard"
vim.cmd("colorscheme gruvbox-material")

-- Plugin Config Files
require "plugins.telescope"
require('gitsigns').setup()
require('which-key').setup()
require('copilot').setup()
require('lualine').setup({
  options = {
    theme = 'gruvbox-material'
  }
})
