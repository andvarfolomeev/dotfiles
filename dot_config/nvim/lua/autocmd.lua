vim.cmd([[ autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 ]])
vim.cmd([[ autocmd FileType lua,javascript,typescript,json,markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2 ]])

vim.cmd(
	[[ autocmd BufWritePre * if expand('<afile>:p') !~ '^\w\w\+:[\\/][\\/]' | call mkdir(fnamemodify(expand('<afile>:p'), ':p:h'), 'p') | endif]]
)
