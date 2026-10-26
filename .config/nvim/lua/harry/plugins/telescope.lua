return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	branch = "master",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				sorting_strategy = "descending", -- fixes lsp_workspace_symbols cursor crash (telescope #3163)
			},
			pickers = {
				lsp_dynamic_workspace_symbols = {
					-- ponytail: telescope's generic picker already path-filters on entry.filename
					-- (pickers.lua:1430) -- no entry_maker wrapper needed.
					-- Lua patterns vs an absolute path, so no ^ anchor.
					file_ignore_patterns = { "/%.next/", "/graphql/" },
				},
				buffers = {
					ignore_current_buffer = true,
					sort_lastused = true,
					mappings = {
						i = { ["<c-d>"] = "delete_buffer" },
						n = { ["d"] = "delete_buffer" },
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
