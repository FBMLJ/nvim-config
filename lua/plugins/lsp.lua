return {
  {
    "mason-org/mason.nvim",
     opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },

     config = function()
      local lspconfig = require("lspconfig")

      local on_attach_global = function(client, bufnr)
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        local opts = { noremap = true, silent = true }

        buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

        buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

        buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

        buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
        buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      end

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach_global,
            })
          end,
        },
      })
    end,


},
  { "neovim/nvim-lspconfig", }, -- Este plugin é uma dependência e é usado pelo mason-lspconfig
{
    'hrsh7th/nvim-cmp', -- O motor de autocompletar
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',    -- Fonte: Sugestões do LSP
      'hrsh7th/cmp-buffer',      -- Fonte: Palavras no buffer atual
      'hrsh7th/cmp-path',        -- Fonte: Caminhos de arquivo
      'hrsh7th/cmp-cmdline',     -- Fonte: Para autocompletar na linha de comando do Neovim (opcional)
      'saadparwaiz1/cmp_luasnip', -- Integração com Luasnip (se for usar snippets)
      'L3MON4D3/LuaSnip',        -- Plugin de snippets (recomendado)
    },
    config = function()
      -- Configuração do nvim-cmp
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          -- REQUIRED - For snippets to work properly
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(), -- Abre o menu de sugestões
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirma a seleção com Enter
          -- Mapeamento para pular entre placeholders de snippet (se usar Luasnip)
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }), -- 'i' para modo insert, 's' para modo select (snippet)
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },    -- Sugestões do servidor LSP
          { name = 'luasnip' },     -- Sugestões de snippets
          { name = 'buffer' },      -- Sugestões de palavras no buffer atual
          { name = 'path' },        -- Sugestões de caminhos de arquivo
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              -- Adicione outros menus para outras fontes aqui
            })[entry.source.name]
            return vim_item
          end,
        },
      })

      -- Configuração para autocompletar na linha de comando do Neovim (opcional)
      cmp.setup.cmdline('/', {
        sources = cmp.config.sources({
          { name = 'buffer' }
        })
      })

      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' }
        })
      })
    end
  },


}
