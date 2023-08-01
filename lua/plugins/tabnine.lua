return {
    {
        'codota/tabnine-nvim',
        build = "./dl_binaries.sh",
        config = function()
            require('tabnine').setup({
                disable_auto_comment=true,
                accept_keymap="<Tab>",
                dismiss_keymap = "<C-]>",
                debounce_ms = 799,
                suggestion_color = {gui = "#808080", cterm = 244},
                exclude_filetypes = {"TelescopePrompt"},
                log_file_path = nil, -- absolute path to Tabnine log filesize
                on_attach = function(bufnr)
                    vim.keymap.set("x", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
                    vim.keymap.set("i", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
                    vim.keymap.set("n", "<leader>q", "", { noremap = true, callback = require("tabnine.chat").open })
                end,
            })
        end,
    },
}
