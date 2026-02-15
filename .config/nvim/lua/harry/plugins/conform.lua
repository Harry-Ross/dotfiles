local javascript_fmts = { "prettierd", "prettier", "biome", stop_after_first = true }

return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports", "isort", "black" },
			astro = { "prettier", stop_after_first = true },
			javascript = javascript_fmts,
			typescript = javascript_fmts,
			typescriptreact = javascript_fmts,
			javascriptreact = javascript_fmts,
			json = javascript_fmts,
			jsonc = javascript_fmts,
			html = javascript_fmts,
			css = javascript_fmts,
			cpp = { "clang-format", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			terraform = { "terraform_fmt" },
		},
	},
}
