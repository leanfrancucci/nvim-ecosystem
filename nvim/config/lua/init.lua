function _G.symbol_line()
  local curwin = vim.g.statusline_winid or 0
  local curbuf = vim.api.nvim_win_get_buf(curwin)
  local ok, line = pcall(vim.api.nvim_buf_get_var, curbuf, 'coc_symbol_line')
  return ok and line or ''
end

--vim.o.tabline = '%!v:lua.symbol_line()'
--vim.o.statusline = '%!v:lua.symbol_line()'
vim.o.winbar = '%!v:lua.symbol_line()'

--local api = vim.api
--local exclude_ft = { "help", "git", "markdown", "snippets", "text", "gitconfig", "alpha", "dashboard" }

--require'nvim-treesitter.configs'.setup {
  --highlight = {
    --enable = true,
  --},
--}
