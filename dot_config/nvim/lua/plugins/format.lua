return {
	{
		"stevearc/conform.nvim",
		opts = {
			default_format_opts = {
				timeout_ms = 3000,
				async = false,
				quiet = false,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				json = { "prettier" },
				markdown = { "prettier" },
				yaml = { "prettier" },
				javascript = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				vue = { "prettier", "eslint_d" },
				go = { "goimports" },
			},
		},
		init = function()
			local conform = require("conform")
			vim.api.nvim_create_user_command("Format", function()
				conform.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { nargs = 0 })
			vim.api.nvim_create_user_command("ToggleFormat", function()
				vim.g.auto_formatting = not vim.g.auto_formatting
			end, { nargs = 0 })
			vim.g.auto_formatting = true
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					if not vim.g.auto_formatting then
						return
					end
					conform.format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
