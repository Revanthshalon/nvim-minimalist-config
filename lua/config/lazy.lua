-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_winsize = 30
vim.g.netrw_liststyle = 4
vim.g.netrw_sort_by = "name"
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Detect compose files so docker_compose_language_service attaches only to them
vim.filetype.add({
  filename = {
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["compose.yaml"] = "yaml.docker-compose",
  },
})

-- Detect Helm charts (only inside a directory tree that has a Chart.yaml)
local function helm_ft(ft)
  return function(path)
    if vim.fs.root(path, "Chart.yaml") then
      return ft
    end
  end
end
vim.filetype.add({
  pattern = {
    [".*/templates/.*%.ya?ml"] = helm_ft("helm"),
    [".*/templates/.*%.tpl"] = helm_ft("helm"),
    [".*/templates/NOTES%.txt"] = helm_ft("helm"),
    [".*/values[^/]*%.ya?ml"] = helm_ft("yaml.helm-values"),
  },
})

-- Setup word wraps for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true -- wrap at word boundaries
  end,
})

-- vim.o.guifont = "JetBrainsMono"

local keymap = vim.keymap

keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert mode with jk" })
keymap.set("n", "<leader>pv", "<cmd>Ex<cr>", { desc = "Explore" })
keymap.set("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Clear Highlights" })

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.background = "dark"
opt.splitright = true
opt.splitbelow = true
opt.termguicolors = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = {},
  -- automatically check for plugin updates
  checker = { enabled = true },
})
