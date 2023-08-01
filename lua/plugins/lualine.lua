return {
    { 'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = true,
                theme = 'monokai-pro',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                -- component_seperators = '',
                -- section_separators = '',
                tabline = {
                    lualine_a = {},
                    lualine_b = {'branch'},
                    lualine_c = {'filename'},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
                sections = {lualine_c = {'lsp_progress'}, lualine_x = {'tabnine'}}
            },
        },
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', opt = true, lazy = true },
        },
    },
}
