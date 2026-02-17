return {
	"mason-org/mason-lspconfig.nvim",
	opts = function()
		return {
			ensure_installed = {
	"astro",
	"basedpyright",
  "biome",
	"clangd",
  "denols",
	"eslint",
	"docker_language_server",
	"jsonls",
	"lua_ls",
	"ruff",
	"terraformls",
        -- "vtsls"
},
			automatic_enable = false,
		}
	end,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
