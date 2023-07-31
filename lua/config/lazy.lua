local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   -- bootstrap lazy.nvim
   -- stylua: ignore
   vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  -- 'tpope/vim-fugitive,
  -- 'tpope/vim-rhubarb',
  -- 'tpope/vim-sleuth',
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      -- { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Snippet Engine & its associated nvim-cmp source
      {'L3MON4D3/LuaSnip', version = "2.*", build = "make install_jsregexp" },
      'saadparwaiz1/cmp_luasnip',
      
      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets'
    },
  },
  {
    'loctvl842/monokai-pro.nvim',
    config = function()
      vim.cmd.colorscheme 'monokai-pro'
    end,
  },
  {
    'nvim-telescope/telescope.nvim', 
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'folke/which-key.nvim', 
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {} },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  { 
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },   
  { 
    "nvim-orgmode/orgmode",
    ft = {'org'},
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup{
        org_agenda_files = {'~/Documents/notes/Inbox*.org'},
        org_default_notes_file = '~/Documents/notes/Inbox.org',
      }
    end
   },
   { 'NeogitOrg/neogit', dependencies = 'nvim-lua/plenary.nvim', config = true },
  -- 'JoosepAlviste/nvim-ts-context-commentstring',
  -- 'p00f/nvim-ts-rainbow',
  } , {})

-- vim: ts=2 sts=2 sw=2 et
