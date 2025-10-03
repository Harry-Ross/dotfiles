vim.lsp.enable("astro")
vim.lsp.enable("clangd")
vim.lsp.enable("cmake")
vim.lsp.enable("eslint")
vim.lsp.enable("java_language_server")
vim.lsp.enable("jsonls")
vim.lsp.enable("prettier")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("terraform_ls")

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
})
