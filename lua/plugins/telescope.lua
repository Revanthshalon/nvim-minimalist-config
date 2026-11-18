return {
	"nvim-telescope/telescope.nvim",
	branch = "master", -- using master to fix issues with deprecated to definition warnings
	-- '0.1.x' for stable ver.
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		-- "nvim-tree/nvim-web-devicons",
		"andrew-george/telescope-themes",
	},
	keys = {
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Search String" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope Find Buffers" },
		{ "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "List Diagnostics" },
		{ "<leader>lsd", "<cmd>Telescope lsp_document_symbols<cr>", desc = "List Document Symbols" },
		{ "<leader>pr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{
			"<leader>pWs",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") })
			end,
			desc = "Find Connected Words under cursor",
		},
		{ "<leader>ths", "<cmd>Telescope themes<cr>", desc = "Theme Switcher" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				themes = {
					enable_previewer = true,
					enable_live_preview = true,
					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
					},
				},
			},
		})

		-- load extensions after setup so they pick up their config
		telescope.load_extension("fzf")
		telescope.load_extension("themes")
	end,
}
