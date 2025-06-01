return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "astro", "clangd", "cmake", "eslint", "java_language_server", "jsonls", "ts_ls" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
