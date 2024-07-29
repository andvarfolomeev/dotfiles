return {
  'neovim/nvim-lspconfig',
  opts = function(_, opts)
    return vim.tbl_extend('force', opts, {
      inlay_hints = {
        enabled = false,
      },
      document_highlight = {
        enabled = false,
      },
    })
  end,
}
