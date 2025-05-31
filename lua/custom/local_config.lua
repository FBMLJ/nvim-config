local cwd = vim.fn.getcwd()
local local_config = cwd .. '/.lua/config.lua'

if vim.fn.filereadable(local_config) == 1 then
  dofile(local_config)
end

