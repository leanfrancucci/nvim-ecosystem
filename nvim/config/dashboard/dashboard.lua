-- Configuration for dashboard.
--
-- @author Leandro Francucci

local db = require "dashboard"

db.setup({
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
        },
        packages = { enable = true },
        shortcut = {
            {
                desc = '󰊳 Update plugins',
                group = '@property',
                action = 'PlugUpdate',
                key = 'u',
            },
            {
                desc = '󰊳 Update COC extensions',
                group = '@property',
                action = 'CocUpdate',
                key = 'u',
            },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
            },
        },
        footer = {
            '',
            '',
            '',
            ' 🚀 Success is 10% inspiration and 90% perspiration.',
        },
        preview = {
            file_path
        }
    },
})
