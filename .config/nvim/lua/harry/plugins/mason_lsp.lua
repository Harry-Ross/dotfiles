return {
	"mason-org/mason-lspconfig.nvim",
	opts = function()
		return {
			ensure_installed = {
				"astro",
				"basedpyright",
				"biome",
				"clangd",
				"eslint",
				"docker_language_server",
				"jsonls",
				"lua_ls",
				"marksman",
				"ruff",
				-- "terraformls",
				"tailwindcss",
			},
			automatic_enable = false,
		}
	end,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
