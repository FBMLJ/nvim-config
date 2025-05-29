vim.g.mapleader = "<Space>"
vim.o.encoding="utf-8"
vim.o.fileencoding="utf-8"
vim.o.bomb = false
vim.o.shell = "/bin/bash"
vim.o.fileencodings="utf-8"


vim.opt.clipboard = 'unnamedplus'



require("config.lazy")
require("config.keymaps")
