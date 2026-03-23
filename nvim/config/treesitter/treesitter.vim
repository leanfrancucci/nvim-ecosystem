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
      enable = true,
      disable = {},
    },
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "json",
      "yaml",
      "bash",
      "diff",
      "regex",
      "c",
      "lua",
      "cpp"
    },
  }
EOF
