return {
  { import = 'lazyvim.plugins.extras.editor.fzf' },
  { import = 'lazyvim.plugins.extras.editor.aerial' },
  { import = 'lazyvim.plugins.extras.editor.harpoon2' },
  { 'echasnovski/mini.splitjoin', version = '*', opts = {} },
  {
    'echasnovski/mini.comment',
    version = '*',
    opts = {
      mappings = {
        comment = '<c-c>',
        comment_line = '<c-c>',
        comment_visual = '<c-c>',
        textobject = '<c-c>',
      },
    },
  },
  { 'imsnif/kdl.vim', lazy = false },
  {
    'antosha417/nvim-lsp-file-operations',
    lazy = false,
    opts = {},
    {
      'Wansmer/langmapper.nvim',
      lazy = false,
      config = function()
        local lm = require('langmapper')
        lm.setup()
        lm.hack_get_keymap()
        lm.automapping({ global = true, buffer = true })
      end,
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require('cmp')

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
}
