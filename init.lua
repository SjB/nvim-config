-- Steve Beaulac nvim configuration using kickstart --

-- set <space> as my leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")
require("config.options")
require("config.lsp")

require("config.keymaps")
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
     require("config.autocmds")
  end,
})
