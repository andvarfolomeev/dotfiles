return {
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = true,
	-- 	init = function()
	-- 		vim.cmd("set background=dark")
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
	-- { "sphamba/smear-cursor.nvim", opts = {} },
}
