return {
  { 'folke/lazy.nvim', version = false },
  {
    'LazyVim/LazyVim',
    version = false,
    import = 'lazyvim.plugins',
    opts = {
      colorscheme = 'catppuccin',
      news = { lazyvim = false, neovim = false },
    },
  },
}
