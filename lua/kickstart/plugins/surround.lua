return {
  'kylechui/nvim-surround',
  version = '^3.0.0',
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup {
      -- add config here, currently default
      -- keymaps are ys, ds, cs, cS
    }
  end,
}
