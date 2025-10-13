return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()

		require("Comment").setup({ prehook = prehook })
	end,
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", "nvim-treesitter/nvim-treesitter" },
}
