-- vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

-- netrw
vim.keymap.set("n", "<leader>x", vim.cmd.Ex)

-- window navigation
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]])
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set('n', '<leader>tel', ":Telescope<CR>", opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>ts', builtin.treesitter, opts)

-- lsp-zero
vim.keymap.set('n', '<leader>lsp', vim.cmd.Mason, opts)
vim.keymap.set('n', "<C-S-Space>", ":lua vim.lsp.buf.hover()<CR>", opts)

-- rust-tools
local rust_tools = require("rust-tools")
vim.keymap.set('n', '<leader>e!', function() rust_tools.expand_macro.expand_macro() end, opts)

-- trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- luasnip
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<Tab>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<S-Tab>", function() ls.jump(-1) end, { silent = true })
