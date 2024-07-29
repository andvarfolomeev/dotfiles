return {
  {
    enabled = true,
    name = 'obsidian',
    dir = '~/.config/nvim/lua/obsidian/',
    lazy = 'VeryLazy',
    keys = {
      { '<leader>ov', '<cmd>lua require("obsidian").vault_prompt()<cr>', desc = 'Vault prompt' },
      { '<leader>oc', '<cmd>lua require("obsidian").cd_vault()<cr>', desc = 'Cd vault' },
      { '<leader>on', '<cmd>lua require("obsidian").new_note_prompt()<cr>', desc = 'New note' },
      { '<leader>ot', '<cmd>lua require("obsidian").open_today()<cr>', desc = 'Open today' },
      { '<leader>oT', '<cmd>lua require("obsidian").open_today_prompt()<cr>', desc = 'Open today (shift)' },
      { '<leader>oi', '<cmd>lua require("obsidian").template_picker()<cr>', desc = 'Template picker' },
      { '<leader>of', '<cmd>lua require("obsidian").note_picker()<cr>', desc = 'Note picker' },
      { '<leader>ob', '<cmd>lua require("obsidian").backlinks_picker()<cr>', desc = 'Backlinks picker' },
      { '<leader>or', '<cmd>lua require("obsidian").rename_prompt()<cr>', desc = 'Rename prompt' },
      {
        'gf',
        function()
          if require('obsidian').found_wikilink_under_cursor() ~= nil then
            return '<cmd>lua require("obsidian").go_to()<CR>'
          else
            return 'gf'
          end
        end,
        noremap = false,
        expr = true,
      },
    },
    ---@type ObsidianOptions
    opts = {
      extra_fd_opts = '--exclude assets --exclude journals --exclude _debug_remotely_save',
      vaults = {
        {
          dir = '~/Knowledge/',
          daily = {
            dir = 'journals',
            format = '%Y-%m-%d',
          },
          note = {
            dir = '.',
            transformator = function(filename)
              if filename ~= nil and filename ~= '' then
                return filename
              end
              return string.format('%d', os.time())
            end,
          },
          templates = {
            dir = 'templates',
            date = '%Y-%d-%m',
            time = '%Y-%d-%m',
          },
        },
      },
    },
    -- config = function(_, opts)
    --   local obsidian = require('obsidian')
    --   -- local cmp = require('cmp')
    --   -- cmp.register_source('obsidian', obsidian.get_cmp_source().new())
    --   obsidian.setup(opts)
    -- end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'obsidian',
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require('cmp')
      local obsidian = require('obsidian')

      cmp.register_source('obsidian', obsidian.get_cmp_source().new())
      table.insert(opts.sources, { name = 'obsidian' })
    end,
  },
}
