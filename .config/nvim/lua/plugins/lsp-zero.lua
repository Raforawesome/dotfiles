local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)


local function on_attach(client)
	require("lsp-format").on_attach(client)
end

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		-- 		["rust_analyzer"] = function()
		-- 			require("lspconfig").rust_analyzer.setup({ on_attach = on_attach })
		-- 			require("plugins.rust-tools")
		-- 		end,
		function(name)
			if name ~= "rust_analyzer" then
				require("lspconfig")[name].setup({ on_attach = on_attach })
			end
		end,
		-- lsp_zero.default_setup,
	},
})

require("luasnip.loaders.from_vscode").lazy_load()

-- Pop-up window customization
-- Hover rounded borders with transparent background
local function customise_handler(handler)
	local overrides = { border = "rounded" }
	return vim.lsp.with(function(...)
		local _, winnr = handler(...)
		if winnr then
			vim.api.nvim_win_set_option(winnr, "winblend", 10)
		end
	end, overrides)
end

vim.lsp.handlers["textDocument/hover"] = customise_handler(vim.lsp.handlers.hover)
vim.lsp.handlers["textDocument/signatureHelp"] = customise_handler(vim.lsp.handlers.signature_help)

require('lspconfig.ui.windows').default_options.border = 'rounded'

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
