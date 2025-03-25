" Configuration for notify.
"
" @author Leandro Francucci
"
lua << EOF
require('windows').setup()

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>wv', ':WindowsMaximizeVertically<CR>')
map('n', '<leader>wh', ':WindowsMaximizeHorizontally<CR>')
map('n', '<leader>we', ':WindowsEqualize<CR>')
map('n', '<leader>wm', ':WindowsMaximize<CR>')

EOF
