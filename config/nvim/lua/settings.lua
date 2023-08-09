-- Initalization settings for my config

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.smartindent = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

-- Undofile
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undofile')
vim.opt.undofile = true
