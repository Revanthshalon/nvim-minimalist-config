return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("gruvbox").setup(opts)
    vim.cmd.colorscheme("gruvbox")

    local styles = {
      -- Functions and methods: italic
      ["@function"] = { italic = true },
      ["@function.call"] = { italic = true },
      ["@function.method"] = { italic = true },
      ["@method"] = { italic = true },
      ["@lsp.type.function"] = { italic = true },
      ["@lsp.type.method"] = { italic = true },

      -- Types: bold
      ["@type"] = { bold = true },
      ["@type.builtin"] = { bold = true },
      ["@type.definition"] = { bold = true },
      ["@constructor"] = { bold = true },
      ["@lsp.type.class"] = { bold = true },
      ["@lsp.type.enum"] = { bold = true },
      ["@lsp.type.interface"] = { bold = true },
      ["@lsp.type.struct"] = { bold = true },
      ["@lsp.type.type"] = { bold = true },
      ["@lsp.type.typeParameter"] = { bold = true },
      ["@type.rust"] = { bold = true },
      ["@lsp.type.enum.rust"] = { bold = true },
      ["@lsp.mod.public.rust"] = { bold = true },
      ["@lsp.typemod.enum.public.rust"] = { bold = true },

      ["@function.rust"] = { italic = true },
      ["@lsp.type.function.rust"] = { italic = true },
      ["@lsp.typemod.function.declaration.rust"] = { italic = true },
      ["@lsp.typemod.function.public.rust"] = { italic = true },


      -- Keywords: bold
      ["@keyword"] = { bold = true },
      ["@keyword.conditional"] = { bold = true },
      ["@keyword.repeat"] = { bold = true },
      ["@keyword.return"] = { bold = true },
    }

    for group, style in pairs(styles) do
      local current = vim.api.nvim_get_hl(0, { name = group, link = false })
      vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", current, style))
    end
  end,
}
