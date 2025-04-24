return {
	"mfussenegger/nvim-lint",
	init = function()
		local lint = require("lint")
		lint.linters_by_ft = { javascript = { "eslint_d" }, typescript = { "eslint_d" } }
		vim.api.nvim_create_user_command("Lint", function()
			lint.try_lint()
		end, { nargs = 0 })
		vim.api.nvim_create_user_command("ToggleLint", function()
			vim.g.auto_linting = not vim.g.auto_linting
		end, { nargs = 0 })
		vim.g.auto_linting = true
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*",
			callback = function()
				if not vim.g.auto_linting then
					return
				end
				lint.try_lint()
			end,
		})
	end,
}
