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


--[[
rounded border setups!!!
(this should not have taken as long to figure out as it did)
]]
-- This table can be "single", "double", "rounded", "solid", "shadow", or
-- you can manually specify each border character if you prefer.
local border_style = "rounded"

-- Helper to wrap a handler with a given border style.
local function set_border(handler)
    return vim.lsp.with(handler, { border = border_style })
end

-- Apply a border to hover popups.
vim.lsp.handlers["textDocument/hover"] = set_border(vim.lsp.handlers.hover)

-- Apply a border to signature help popups.
-- signatureHelp is the help with the signatures bolded,
-- which i think is the only one i really use
vim.lsp.handlers["textDocument/signatureHelp"] =
    set_border(vim.lsp.handlers.signature_help)

-- Apply a border to diagnostics floating windows (the main reason lol)
vim.diagnostic.config({
    float = { border = border_style },
})

-- set border to be white since i use nobg
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })

-- only enable this on neovim < 0.70 (leftover from old config)
-- vim.cmd("highlight! FloatBorder guifg=white")

--------------------------------------------------------------------------------
-- 3) (Optional) Adjust other float highlights if you need a consistent appearance

-- Example: make NormalFloat background darker or transparent
-- (use a matching color scheme or theme in your highlights)
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335" })

--------------------------------------------------------------------------------
