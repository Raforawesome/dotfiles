-- [[ VIM GLOBAL SETTINGS ]]
-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- LSP configuration
  server = {
    -- cmd = function()
    --   local mason_registry = require 'mason-registry'
    --   if mason_registry.is_installed 'rust-analyzer' then
    --     -- This may need to be tweaked depending on the operating system.
    --     local ra = mason_registry.get_package 'rust-analyzer'
    --     local ra_filename = ra:get_receipt():get().links.bin['rust-analyzer']
    --     return { ('%s/%s'):format(ra:get_install_path(), ra_filename or 'rust-analyzer') }
    --   else
    --     -- global installation
    --     return { 'rust-analyzer' }
    --   end
    -- end,
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        checkOnSave = {
          command = 'clippy',
        },
      },
    },
  },
  -- DAP configuration
  dap = {},
}

-- import basic vim settings
require 'settings'

-- import keymaps module
require 'keymaps'

-- register autocommands
require 'autocmds'

-- install & configure plugins
require 'plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
