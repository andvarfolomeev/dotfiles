local M = {}

M.load_local_config = function()
  if vim.fn.filereadable(vim.fn.getcwd() .. '/.nvim.lua') == 1 then
    vim.cmd('luafile ' .. vim.fn.getcwd() .. '/.nvim.lua')
  end
end

M.install_lazy = function()
  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

M.mapping = {
  common = function(modes, lhs, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set(modes, lhs, rhs, opts)
  end,
  n = function(lhs, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set({ 'n' }, lhs, rhs, opts)
  end,
  x = function(lhs, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set({ 'v', 'x' }, lhs, rhs, opts)
  end,
  leader = function(suffix, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set('n', '<leader>' .. suffix, rhs, opts)
  end,
  leader_x = function(suffix, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set('x', '<leader>' .. suffix, rhs, opts)
  end,
}

M.pick_config_files = function()
  -- TODO
end

M.wd_picker_of_find_file = function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local sorters = require('telescope.sorters')
  local find_files = require('telescope.builtin').find_files

  pickers
    .new({}, {
      prompt_title = 'Workdirectory picker',
      finder = finders.new_table({ results = vim.g.wds }),
      sorter = sorters.get_fzy_sorter(),
      attach_mappings = function(_, _)
        actions.select_default:replace(function(_)
          telescope.setup({ defaults = { history = true } })
          local selection = action_state.get_selected_entry()[1]
          find_files({ cwd = selection })
        end)
        return true
      end,
    })
    :find()
end

local slow_format_filetypes = { 'typescript' }

M.format_on_save = function(bufnr)
  if slow_format_filetypes[vim.bo[bufnr].filetype] then
    return
  end
  local function on_format(err)
    if err and err:match('timeout$') then
      slow_format_filetypes[vim.bo[bufnr].filetype] = true
    end
  end
  return { timeout_ms = 1000, lsp_fallback = true }, on_format
end

M.format_after_save = function(bufnr)
  if not slow_format_filetypes[vim.bo[bufnr].filetype] then
    return
  end
  return { lsp_fallback = true }
end

M.disable_formatting_for_client = function(client)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false
end

M.escape = function(str)
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

return M
