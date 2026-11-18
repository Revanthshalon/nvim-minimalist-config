return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "ruff",
      "clangd",
      "angularls",
      "tombi",
      "protols",
      "taplo",
      "rust_analyzer",
      "biome",
      "cmake",
      "css_variables",
      "docker_compose_language_service",
      "dockerls",
      "terraformls",
    },
    automatic_enable = true,
  },
}
