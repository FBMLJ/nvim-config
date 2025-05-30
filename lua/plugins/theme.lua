return {
    
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
                style = "night",
                transparent_background=true ,
                
        })

        vim.cmd("colorscheme catppuccin")
    end

}
