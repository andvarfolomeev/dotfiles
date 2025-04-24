return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>F", builtin.pickers)
			vim.keymap.set("n", "<leader>f", builtin.find_files)
			vim.keymap.set("n", "<leader>b", builtin.buffers)
			vim.keymap.set("n", "<leader>j", builtin.jumplist)
			vim.keymap.set("n", "<leader>s", builtin.lsp_dynamic_workspace_symbols)
			vim.keymap.set("n", "<leader>S", builtin.lsp_document_symbols)
			vim.keymap.set("n", "<leader>d", builtin.diagnostics)
			vim.keymap.set("n", "gd", builtin.lsp_definitions)
			vim.keymap.set("n", "gy", builtin.lsp_type_definitions)
			vim.keymap.set("n", "gr", builtin.lsp_references)
			vim.keymap.set("n", "gi", builtin.lsp_implementations)
			vim.keymap.set("n", "<leader>/", builtin.live_grep)
			vim.keymap.set("n", "<leader>:", builtin.command_history)
			vim.keymap.set("n", "<leader>'", builtin.resume)
			vim.keymap.set("n", "<leader>x", function()
				local filename = vim.fn.expand("%:p")
				local pattern = "**/src/modules/integrations/([^/]+)**"
				local providername = string.match(filename, pattern)
				if providername == nil then
					return nil
				end
				local fullpath = vim.fn.expand("src/modules/integrations/" .. providername)
				require("telescope.builtin").find_files({ cwd = fullpath })
			end)
		end,
	},
}
