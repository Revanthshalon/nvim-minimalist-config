return {
	"nvim-lualine/lualine.nvim",
	options = {
		theme = "rose-pine-moon",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local mode = {
			"mode",
			fmt = function(str)
				-- Replaced Vim icon with plain text tag
				return "[VIM] " .. str
			end,
		}

		local diff = {
			"diff",
			colored = true,
			-- Replaced special icons with text indicators (+ / ~ / -)
			symbols = { added = "+", modified = "~", removed = "-" }, 
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}

		-- Replaced git branch icon with a text label
    local branch = { "branch", icon = "Branch:" }

		lualine.setup({
			-- 1. Globally disable devicon integrations
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
        icons_enabled = false,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "filetype" },
				},
			},
		})
	end,
}
