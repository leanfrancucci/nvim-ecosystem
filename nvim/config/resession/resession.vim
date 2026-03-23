" Configuration for notify.
"
" @author Leandro Francucci
"
lua << EOF
local resession = require("resession")
resession.setup({
  autosave = {
    enabled = false,
    interval = 600,
    notify = true,
  },
})

-- Resession does NOTHING automagically, so we have to set up some keymaps
vim.keymap.set("n", "<leader>ss", resession.save)
vim.keymap.set("n", "<leader>sl", resession.load)
vim.keymap.set("n", "<leader>sd", resession.delete)
EOF
