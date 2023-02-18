local o = vim.o
local g = vim.g


g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- UI enhancements
o.number = true
o.relativenumber=true
o.scrolloff = 7
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
vim.opt.termguicolors = true
vim.opt.guifont = { "JetBrains Mono", "h8" }

-- General Settings
o.encoding="utf-8"
o.swapfile = false
o.clipboard = "unnamedplus"
o.fileformat = "unix"


