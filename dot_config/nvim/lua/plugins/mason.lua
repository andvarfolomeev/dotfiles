return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"vtsls",
				"typescript-language-server",
				"prettier",
				"eslint_d",
				"js-debug-adapter",
				"pyright",
				"gopls",
				"goimports",
				"clangd",
				"vetur-vls",
			},
		},
	},
}
