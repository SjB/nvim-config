require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt"},
  log_file_path = nil, -- absolute path to Tabnine log file
})

-- api.nvim_set_keymap("x", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
-- api.nvim_set_keymap("i", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
-- api.nvim_set_keymap("n", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
