return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      mappings = false,  -- Disables all keymap and rule-based icons
      breadcrumb = ">>", -- Plain ASCII symbol for active key combo in command line
      separator = "->",  -- Plain ASCII symbol between a key and its label
      group = "+",       -- Symbol prepended to a keymap group
      -- Replace Nerd Font icons for special keys with plain text
      keys = {
        Up = "<Up> ",
        Down = "<Down> ",
        Left = "<Left> ",
        Right = "<Right> ",
        C = "C-",
        M = "M-",
        D = "D-",
        S = "S-",
        CR = "<CR> ",
        Esc = "<Esc> ",
        ScrollWheelDown = "<ScrollDown> ",
        ScrollWheelUp = "<ScrollUp> ",
        NL = "<NL> ",
        BS = "<BS> ",
        Space = "<Space> ",
        Tab = "<Tab> ",
        F1 = "F1",
        F2 = "F2",
        F3 = "F3",
        F4 = "F4",
        F5 = "F5",
        F6 = "F6",
        F7 = "F7",
        F8 = "F8",
        F9 = "F9",
        F10 = "F10",
        F11 = "F11",
        F12 = "F12",
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
