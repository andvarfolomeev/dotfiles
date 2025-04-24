return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
			{ "zeioth/garbage-day.nvim", opts = {} },
		},
		init = function()
			vim.diagnostic.config({ virtual_text = false })
			for _, type in pairs({ "Error", "Warn", "Hint", "Info" }) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = "●", texthl = hl, numhl = "" })
			end
			local lazydev = require("lazydev")
			local lspconfig = require("lspconfig")
			local blink = require("blink.cmp")
			---@diagnostic disable-next-line: missing-fields
			lazydev.setup({
				library = { { path = "luvit-meta/library", words = { "vim%.uv" } }, "~/LLS-Addons/love2d" },
			})
			local lspconfig_defaults = lspconfig.util.default_config
			lspconfig_defaults.capabilities = blink.get_lsp_capabilities(lspconfig_defaults.capabilities)
			lspconfig.pyright.setup({})
			lspconfig.vtsls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.vuels.setup({})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = { completion = { callSnippet = "Disable", keywordSnippet = "Disable" } },
					telemetry = { enable = false },
				},
			})
		end,
	},
}
