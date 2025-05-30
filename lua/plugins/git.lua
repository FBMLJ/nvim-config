
return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local map = vim.keymap.set
                    map("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
                    map("n", "<leader>gs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
                end
            })
        end,
    },

    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gdiffsplit", "Gblame" }, -- carrega só quando esses comandos são usados
    },

    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("diffview").setup({})
        end,
        cmd = { "DiffviewOpen", "DiffviewFileHistory" }, -- lazy load
    },

    {
        "NeogitOrg/neogit",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neogit").setup({})
        end,
        keys = {
            { "<leader>gg", function() require("neogit").open() end, desc = "Abrir Neogit" },
        }
    },


}

