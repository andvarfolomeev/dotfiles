local escape = require('config.functions').escape

vim.g.vscode = true

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
local langmap = vim.fn.join({
  escape(ru_shift) .. ';' .. escape(en_shift),
  escape(ru) .. ';' .. escape(en),
}, ',')

vim.opt.spell = false
vim.opt.spelllang = 'en_us,ru_ru'
vim.opt.langmap = langmap

vim.g.mapleader = ' '
vim.opt.compatible = false

vim.opt.fileformat = 'unix'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.confirm = true

vim.opt.timeoutlen = 300
vim.opt.updatetime = 200

vim.opt.ttyfast = true
-- vim.opt.lazyredraw = true

vim.opt.scrolloff = 8
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes:3'
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3

vim.opt.inccommand = 'split'
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.magic = true

vim.opt.foldmethod = 'marker'

vim.opt.autoread = true

-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shortmess = vim.opt.shortmess + { c = true, F = true, W = true, I = true }
vim.opt.pumheight = 5
vim.opt.pumblend = 10

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.errorbells = false
vim.opt.visualbell = true

vim.opt.background = 'dark'
