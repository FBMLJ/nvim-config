
-- lazy.lua ou plugins/ui.lua
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          icons_enabled = true,
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        tabline = {
          lualine_a = {
            {
              "buffers",
              show_filename_only = true,
              hide_filename_extension = false,
              show_modified_status = true,
              mode = 0, -- 0: bufname, 1: relative path, 2: absolute path
              max_length = vim.o.columns * 2 / 3,
              symbols = {
                modified = " ●",
                alternate_file = "#",
                directory = "",
              },
            },
          },
          lualine_z = { "tabs" },
        },
        extensions = {},
      })
    end,
  },
}

