return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	branch = "0.1.x",
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
    pickers = {
				buffers = {
					ignore_current_buffer = true,
					sort_lastused = true,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						},
						n = {
							["d"] = "delete_buffer",
						},
					},
				},
			},

	},
	-- tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
