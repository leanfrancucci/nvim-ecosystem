" Code highlight configuration.
"
" @author Maciej Bedra

" Treesitter setup.
lua << EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = false,
      disable = {},
    },
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "json",
      "yaml"
    },
  }
EOF
