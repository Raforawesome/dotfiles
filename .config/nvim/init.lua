--[[
	VIM SETUP
]]
vim.cmd("set number")         -- show line numbers
vim.cmd("set relativenumber") -- make line numbers relative to cursor
vim.cmd("set tabstop=4")      -- make tab width 4
vim.cmd("set shiftwidth=4")   -- Make vim indenter use 4 width as well
vim.cmd("set ignorecase")     -- Make searches case-insensitive
vim.cmd("set smartcase")      -- Make searches only case-sensitive if you use a capital

-- Set completeopt to have a better completion experience (:help completeopt)
-- menuone: popup even when there"s only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noselect"

local signs = { error = "", warn = "", hint = "", info = " " }
for type, icon in pairs(signs) do
	local hl = "diagnosticsign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end



--[[
	PLUGIN INSTALLATION
]]
-- First run will installer packer and plugins
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim",    branch = "0.1.x" },
	{ "rose-pine/neovim",                 name = "rose-pine" },
	{ "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "VonHeikemen/lsp-zero.nvim",        branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "hrsh7th/vim-vsnip" },
	{ "simrat39/rust-tools.nvim" },
	{ "lukas-reineke/lsp-format.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "airblade/vim-gitgutter" },
	{ "nvim-lualine/lualine.nvim" },
	{ "saecki/crates.nvim",               tag = "stable" },
	{ "mfussenegger/nvim-dap" },
	{ "rafamadriz/friendly-snippets" },
	{ "j-hui/fidget.nvim" },
	{ "folke/trouble.nvim" }
})



--[[
	PLUGIN CONFIGURATION
]]
-- Load all complex setups from files
require("plugins.treesitter")
require("plugins.rose-pine")
require("plugins.lsp-zero")
require("plugins.rust-tools")
require("plugins.cmp")

-- Theming
vim.cmd("colorscheme rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- crates
require("crates").setup()

-- lualine
require("lualine").setup({ options = { theme = "auto" } })

-- fidget
require("fidget").setup({
	notification = { window = { border = "none", winblend = 0 } }
})



--[[
	LOADING MODULES
]]
require("remaps") -- keybinds lua file
