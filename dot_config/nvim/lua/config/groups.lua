-- Set indentation to 2 spaces
vim.api.nvim_create_augroup('setIndent', { clear = true })
local languages_with_2_space = {
  'cpp',
  'javascript',
  'javascriptreact',
  'json',
  'lua',
  'markdown',
  'nix',
  'typescript',
  'vue',
}
vim.api.nvim_create_autocmd('Filetype', {
  group = 'setIndent',
  pattern = languages_with_2_space,
  command = 'setlocal shiftwidth=2 tabstop=2 softtabstop=2',
})
-- Enter insert mode when switching to terminal
vim.api.nvim_create_autocmd(
  'TermOpen',
  { command = 'setlocal listchars = nonumber norelativenumber nocursorline' }
)
vim.api.nvim_create_autocmd(
  'TermOpen',
  { pattern = '', command = 'startinsert' }
)
-- Close terminal buffer on process exit
vim.api.nvim_create_autocmd(
  'BufLeave',
  { pattern = 'term://*', command = 'stopinsert' }
)
-- Delete term buffer
vim.api.nvim_create_autocmd(
  'TermClose',
  { pattern = 'term://*/bin/zsh', command = 'bd!' }
)
