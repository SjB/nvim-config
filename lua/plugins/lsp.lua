return  {
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            -- { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            {'folke/neodev.nvim', config = true },
        },
    },
    {
       "utilyre/barbecue.nvim",
       event = "VeryLazy",
       dependencies = {
          "neovim/nvim-lspconfig",
          "SmiteshP/nvim-navic",
          "nvim-tree/nvim-web-devicons",
       },
       config = true,
  },
}
