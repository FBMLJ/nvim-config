vim.g.mapleader = "<Space>"
vim.o.encoding="utf-8"
vim.o.fileencoding="utf-8"
vim.o.bomb = false
vim.o.shell = "/bin/bash"
vim.o.fileencodings="utf-8"

vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'

vim.opt.autoindent = true       -- Reaproveita a indentação da linha anterior
vim.opt.smartindent = true      -- Indenta automaticamente estruturas como if, for, etc.
vim.opt.tabstop = 4             -- Tamanho do "tab" (visual)
vim.opt.shiftwidth = 4          -- Tamanho da indentação (<< e >>)
vim.opt.expandtab = true        -- Usa espaços ao invés de tabs

require("config.lazy")
require("config.keymaps")
