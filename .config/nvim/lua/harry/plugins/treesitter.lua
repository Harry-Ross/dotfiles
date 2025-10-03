return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "astro", "css", "cpp", "javascript", "terraform", "typescript", "tsx" },
		auto_install = true,
		highlight = { enable = true },
	},
}
