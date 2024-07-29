require('config.functions').load_local_config()
require('config.functions').install_lazy()
require('config.groups')
require('config.mapping')
require('config.options')
require('lazy').setup({
  { import = 'plugins.lazy' },
  { import = 'plugins' },
})
