" Configuration for indent-blankline.
"
" @author Leandro Francucci
lua << EOF
local hooks = require "ibl.hooks"

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp"},
    callback = function()
        vim.treesitter.start()
    end,
})

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#61AFEF" }) -- Example color (blueish) and transparency
end)

require('ibl').setup({
    indent = {
        char = '▏',
        smart_indent_cap = true,
    },
    scope = {
        char = '▏',
        show_start = false,
        highlight = { "RainbowViolet" },
        exclude = {
            node_type = { c = { "comment" } }
        },
    },
    exclude = {
        filetypes = { "dashboard", "NvimTree", "Trouble", "Float" },
        buftypes = { "telescope" },
    },
})
EOF

