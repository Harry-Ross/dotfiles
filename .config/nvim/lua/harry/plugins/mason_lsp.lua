return {
	"mason-org/mason-lspconfig.nvim",
	opts = function()
		local servers = require("harry.lsp.servers")
		return {
			ensure_installed = servers,
			automatic_enable = false,
		}
	end,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
