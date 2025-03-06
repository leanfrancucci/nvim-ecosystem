" Configuration for codecompanion.
"
" @author Leandro Francucci

lua << EOF
require('render-markdown').setup({
  file_types = { 'markdown', 'codecompanion' },
  heading = { position = 'inline' },
})
vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { link = 'DiffText', default = true })
vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { link = 'DiffText', default = true })
vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { link = 'DiffText', default = true })
vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { link = 'DiffText', default = true })
EOF
