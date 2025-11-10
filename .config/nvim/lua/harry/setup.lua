vim.o.background = "dark"

vim.opt.termguicolors = true

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, { desc = "Telescope document symbols" })
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Telescope workplace symbols" })
vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, { desc = "Telescope type definition" })
vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Telescope current bu" })
vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Telescope registers" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Telescope marks" })

vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Telescope treesitter" })

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.o.mouse = "a"

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_set_keymap(
	"n",
	"gD",
	"<cmd>lua vim.lsp.buf.declaration()<CR>",
	{ desc = "Declaration", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"gd",
	"<cmd>lua vim.lsp.buf.definition()<CR>",
	{ desc = "Definition", noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>lr",
	"<cmd>:LspRestart<CR>",
	{ desc = "LSP Restart", noremap = true, silent = true }
)
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Put to clipboard" })

require("harry.lsp")

vim.keymap.set("n", "<leader>r", function()
	vim.lsp.buf.references()
end, { desc = "Find references" })

vim.keymap.set("n", "<leader>i", function()
	vim.lsp.buf.implementation()
end, { desc = "Go to implementation" })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
