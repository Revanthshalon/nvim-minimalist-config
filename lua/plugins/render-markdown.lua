return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you use the mini.nvim suite
  keys = {
    { '<leader>mt', '<cmd>RenderMarkdown toggle<CR>', desc = 'Toggle Markdown Rendering' },
  },
  opts = {
    completions = {
      lsp = {
        enabled = true,
      },
    },
  },
}
