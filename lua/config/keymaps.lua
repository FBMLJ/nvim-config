
-- Definição de grupos que aparece no which-key
--
local wk = require("which-key")
wk.add({
    {"<leader>p", group = "LSP/Código"},
    {"<leader>r", group="Refatoração"},
    {"<leader>g", group="Git"},
    {"<leader>f",group = "Busca"},
    {"<leader>n", group= "Navegação"},
    {"<leader>d",group= "Run/Debug"},
    {"<leader>t", group="Testes"},
    {"<leader>s", group="Split Tela"}
})



--Leader atalhos

-- Navegação entre janelas com Ctrl + h/j/k/l
-- Isso é MUITO comum e recomendado para quem não usa tmux/terminal multiplexer com os mesmos atalhos
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true, desc = "Mover para janela à esquerda" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true, desc = "Mover para janela abaixo" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true, desc = "Mover para janela acima" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true, desc = "Mover para janela à direita" })

-- Redimensionar janelas com a Leader Key (ou outra combinação)
-- Supondo que sua leader key seja <Space>
-- TODO: refazer essas configurações
vim.keymap.set('n', '<Leader>=', '<C-w>=', { silent = true, desc = "Equalizar tamanhos das janelas" })
vim.keymap.set('n', '<Leader>+', '<C-w>+', { silent = true, desc = "Aumentar altura da janela" })
vim.keymap.set('n', '<Leader>-', '<C-w>-', { silent = true, desc = "Diminuir altura da janela" })
vim.keymap.set('n', '<Leader><', '<C-w><', { silent = true, desc = "Diminuir largura da janela" })
vim.keymap.set('n', '<Leader>>', '<C-w>>', { silent = true, desc = "Aumentar largura da janela" })

-- Fechar janela atual
vim.keymap.set('n', '<Leader>nc', '<C-w>c', { silent = true, desc = "Fechar janela atual" })
-- Fechar todas as outras janelas
vim.keymap.set('n', '<Leader>no', '<C-w>o', { silent = true, desc = "Manter apenas a janela atual" })

-- Abrir nova split (horizontal ou vertical)
vim.keymap.set('n', '<Leader>sv', ':vsplit<CR>', { silent = true, desc = "Dividir janela verticalmente" })
vim.keymap.set('n', '<Leader>sh', ':split<CR>', { silent = true, desc = "Dividir janela horizontalmente" })





-- Mapeamento para alternar a visibilidade do nvim-tree
vim.keymap.set('n', '<Leader>nt', ':NvimTreeToggle<CR>', { silent = true, desc = "Alternar NvimTree" })

-- Mapeamento para focar no arquivo atual no NvimTree (abre se fechado)
vim.keymap.set('n', '<Leader>nf', ':NvimTreeFindFile<CR>', { silent = true, desc = "Encontrar arquivo atual no NvimTree" })


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ft', ':TodoTelescope<CR>', {desc = "Telescope encontrar TODOs"})



local lspconfig = require("lspconfig")

vim.keymap.set("n", "<leader>pd", vim.lsp.buf.hover, {desc = "Mostrar definição"})
vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, {desc = "Formatar"})
vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, {desc = "Renomeia simbolo"})

local dap = require("dap")
local dapui= require("dapui")
vim.keymap.set("n","<leader>do",dapui.toggle, {desc = "Exibir/Ocultar Menu Debug"})
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {desc = "Adicionar/Remover breakpoint"})
vim.keymap.set("n","<leader>dc", dap.continue, {desc = "Continue debug"} )
vim.keymap.set("n", "<leader>ds", dap.step_over, {desc = "Step Over"})



vim.keymap.set("n", "<C-p>", builtin.find_files)
-- Atalho Ctrl
--

local api = require("Comment.api")


-- Modo visual: comenta seleção
vim.keymap.set("v", "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Comentar seleção", silent = true })
vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, { desc = "Comentar linha", silent = true })



-- Ações de codigo

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, {desc="Mostrar suas referências"})
vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, {desc="Mostrar suas referências"})
vim.keymap.set("n", "<leader>cl", vim.diagnostic.open_float, {desc="Mostrar suas referências"})
-- vim.api.nvim_set_keymap("n", "<leader>cr", vim.lsp.buf.refereces, {desc="Mostrar suas referências"})
-- vim.api.nvim_set_keymap("n", "<leader>cr", vim.lsp.buf.refereces, {desc="Mostrar suas referências"})


local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ts", ":TestSuite<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tv", ":TestVisit<CR>", opts)
-- atalhos teclados
vim.keymap.set("n","<A-h>",":bp<CR>")
vim.keymap.set("n","<A-l>",":bn<CR>")
vim.keymap.set("n","<A-d>",":bd<CR>")
