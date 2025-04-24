vim.g.mapleader = " "
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.cmd("filetype plugin indent on")
vim.opt.compatible = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.autoread = true
vim.opt.confirm = true
vim.opt.inccommand = "split"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.magic = true
vim.opt.wrap = false
vim.cmd([[autocmd FileType markdown setlocal linebreak ]])
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.background = "dark"
vim.opt.statusline = "%f %= %y %l, %c"
vim.opt.foldmethod = "marker"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
local escape = function(str)
	return vim.fn.escape(str, [[;,."|\]])
end
vim.opt.langmap = vim.fn.join({
	escape([[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]) .. ";" .. escape(
		[[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
	),
	escape([[ёйцукенгшщзхъфывапролджэячсмить]]) .. ";" .. escape(
		[[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
	),
}, ",")

vim.cmd([[ set shiftwidth=2 tabstop=2 softtabstop=2 ]])

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
