" Configuration for bufferline.
"
" @author Leandro Francucci
"
lua << EOF
require('bufferline').setup {
  options = {
    mode = "tabs", -- set to "tabs" to only show tabpages instead
    diagnostics = "coc",
    separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    },
  }
}
EOF
