return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    incremental_selection = {
      enabled = true,
      keymaps = {
        init_selection = '+',
        node_incremental = '+',
        scope_incremental = false,
        node_decremental = '-',
      },
    },
  },
}
