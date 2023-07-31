-- set <space> as my leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true

vim.o.backup = false
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 1
vim.o.completeopt = 'menuone,noselect'
vim.o.conceallevel = 0
vim.o.hlsearch = false
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.mouse = "a"
vim.o.pumheight = 10
vim.o.showmode = false
vim.o.showtabline = 0
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.timeoutlen = 1000
vim.o.undofile = true
vim.o.updatetime = 50 -- default 250
vim.o.timeoutlen = 300
vim.o.writebackup = false
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 3
vim.o.showcmd = false
vim.o.ruler = false
vim.o.numberwidth = 4
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- the primagen options
vim.o.guicursor = ""
vim.o.nu = true
vim.o.errorbells = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.softtabstop = 4
vim.o.incsearch = true
vim.o.scrolloff =  8
vim.o.signcolumn = "yes"


-- vim.opt.fillchars.eob = " "

-- vim.opt.shortmess:append("c")
-- vim.opt.whichwrap:append("<,>,[,],h,l")
-- vim.opt.iskeyword:append(".")

-- vim.o.isfname:append("@-@")

-- vim.o.colorcolumn = "80"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- vim: ts=2 sts=2 sw=2 et
