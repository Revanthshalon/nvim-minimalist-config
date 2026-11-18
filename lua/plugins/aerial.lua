return {
	"stevearc/aerial.nvim",
	opts = {
    nerd_font = false,
  },
  keys = {
    {
      "<leader>a",
      "<cmd>AerialToggle!<CR>",
      desc = "Toggle Aeria"
    },
  },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
