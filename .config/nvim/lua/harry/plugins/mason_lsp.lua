return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"astro",
			"clangd",
			"cmake",
			"eslint",
			"jsonls",
			"terraformls",
			"ts_ls",
			"ruff",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
