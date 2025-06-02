local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "failed to clone lazy.nvim:\n", "errormsg" },
            { out, "warningmsg" },
            { "\npress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function load_project_plugins(dirname, filename)
    local project_plugins_table = {}
    local full_dir_path = vim.fn.getcwd() .. "/" .. dirname
    local full_file_path = full_dir_path .. "/" .. filename

    if vim.fn.isdirectory(full_dir_path) == 1 then
        if vim.fn.filereadable(full_file_path) then
            local success, loaded_content = pcall(dofile, full_file_path)
            if success and type(loaded_content) == "table" then
                project_plugins_table = loaded_content
            end
        end
    end
    return project_plugins_table
end

local project_specific_plugins = load_project_plugins(".lua/", "plugins.lua")

local final_specs = {
    { import = "plugins" },
    project_specific_plugins,
}

require("lazy").setup(final_specs, {
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})
