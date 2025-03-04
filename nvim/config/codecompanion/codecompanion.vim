" Configuration for codecompanion.
"
" @author Leandro Francucci

lua << EOF
  require("codecompanion").setup({
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
    }
  })
EOF
