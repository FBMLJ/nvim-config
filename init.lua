vim.g.mapleader = "<Space>"
vim.o.encoding="utf-8"
vim.o.fileencoding="utf-8"
vim.o.bomb = false
vim.o.shell = "/bin/bash"
vim.o.fileencodings="utf-8"

vim.opt.smartcase = true       -- mas respeita se você usar letras maiúsculas
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.opt.autoindent = true       -- Reaproveita a indentação da linha anterior
vim.opt.smartindent = true      -- Indenta automaticamente estruturas como if, for, etc.
vim.opt.tabstop = 4             -- Tamanho do "tab" (visual)
vim.opt.shiftwidth = 4          -- Tamanho da indentação (<< e >>)
vim.opt.expandtab = true        -- Usa espaços ao invés de tabs

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
require("config.lazy")
require("config.keymaps")
require("custom.local_config")
--Linhas para habilitar transparencia dentro do container
vim.opt.termguicolors = true
vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight NormalNC guibg=NONE ctermbg=NONE]]
