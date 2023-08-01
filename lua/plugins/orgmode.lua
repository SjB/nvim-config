return {
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
}

