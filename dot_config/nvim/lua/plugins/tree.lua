return {
	{
		"echasnovski/mini.files",
		dependencies = {
			"folke/snacks.nvim",
		},
		version = "*",
		init = function()
			local files = require("mini.files")
			vim.keymap.set("n", "<leader>n", files.open)
			vim.keymap.set("n", "<leader>N", function()
				files.open(vim.api.nvim_buf_get_name(0))
			end)
			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesActionRename",
				callback = function(event)
					Snacks.rename.on_rename_file(event.data.from, event.data.to)
				end,
			})
		end,
	},
}
