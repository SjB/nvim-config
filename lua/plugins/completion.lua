return {
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        opts = function()
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require("cmp")
            local defaults = require("cmp.config.default")()
            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<S-CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<Tab>'] = require('cmp').mapping(function(fallback)
                          if require('cmp').visible() then
                             require('cmp').select_next_item()
                          elseif require('luasnip').expand_or_locally_jumpable() then
                             require('luasnip').expand_or_jump()
                          else
                             fallback()
                          end

                    end, { 'i', 's' }),
                    ['<S-Tab>'] = require('cmp').mapping(function(fallback)
                          if require('cmp').visible() then
                             require('cmp').select_prev_item()
                          elseif require('luasnip').locally_jumpable(-1) then
                             require('luasnip').jump(-1)
                          else
                             fallback()
                          end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                experimental = {
                    ghost_text = {
                        hl_group = "CmpGhostText",
                    },
                },
                sorting = defaults.sorting,
            }
        end,
        dependencies = {
            -- Adds LSP completion capabilities
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            {
                'saadparwaiz1/cmp_luasnip',
                dependencies = {

                    -- Snippet Engine & its associated nvim-cmp source
                    {
                        'L3MON4D3/LuaSnip',
                        version = "2.*",
                        build = "make install_jsregexp",
                        opts = {
                            history = true,
                            delete_check_events = "TextChanged",
                        },
                        dependencies = {
                            -- Adds a number of user-friendly snippets
                            {
                                'rafamadriz/friendly-snippets',
                                config = function()
                                    require('luasnip.loaders.from_vscode').lazy_load()
                                end,
                            },
                        },
                    },
                },
            },

        },
    },
}
