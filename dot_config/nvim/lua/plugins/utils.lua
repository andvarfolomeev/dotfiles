return {
	{ "meznaric/key-analyzer.nvim", opts = {} },
	{
		"rest-nvim/rest.nvim",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "http",
				callback = function()
					vim.keymap.set("n", "<leader>x", "<cmd>Rest run<CR>", { buffer = true, silent = true })
				end,
			})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "json" },
				callback = function()
					vim.api.nvim_set_option_value("formatprg", "jq", { scope = "local" })
				end,
			})
		end,
	},
}
