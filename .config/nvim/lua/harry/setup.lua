vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.opt.termguicolors = true

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, { desc = "Telescope document symbols" })
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Telescope workplace symbols" })

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require('harry.lsp')

vim.keymap.set('n', '<leader>r', function()
  vim.lsp.buf.references()
end, { desc = "Find references" })

vim.keymap.set('n', '<leader>i', function()
  vim.lsp.buf.implementation()
end, { desc = "Go to implementation" })

