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
        keymaps = {
          accept_change = {
            modes = { n = "ga" },
          },
          reject_change = {
            modes = { n = "<leader>gr" },
          },
        },
      },
    },
  })
EOF
