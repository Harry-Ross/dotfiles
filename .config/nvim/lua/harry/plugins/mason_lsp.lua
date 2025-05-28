return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clangd", "eslint", "ts_ls", "terraformls" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
