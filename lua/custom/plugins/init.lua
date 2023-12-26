-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

	-- Remaps
	{
		require('vim.keymap').set('i', '<C-c>', '<Esc>'),
		require('vim.keymap').set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true }),
		require('vim.keymap').set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true }),
	},

	-- Autopairs
	{
		'windwp/nvim-autopairs',
		-- Optional dependency
		dependencies = { 'hrsh7th/nvim-cmp' },
		config = function()
			require('nvim-autopairs').setup {}
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
			local cmp = require 'cmp'
			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
		end,
	},

	-- Autocompletion
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = function()
			require('copilot').setup {
				suggestion = { enabled = false },
				panel = { enabled = false },
			}
		end,
	},
	{
		'zbirenbaum/copilot-cmp',
		after = { 'copilot.lua' },
		config = function()
			require('copilot_cmp').setup()
		end,
	},

	-- File Manager
	{
		'nvim-tree/nvim-tree.lua',
		version = '*',
		lazy = false,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('nvim-tree').setup()
			require('vim.keymap').set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
		end,
	},

	-- Formatter
	{
		'stevearc/conform.nvim',
		lazy = true,
		event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
		config = function()
			local conform = require 'conform'

			conform.setup {
				formatters_by_ft = {
					javascriptreact = { { 'prettierd', 'prettier' } },
					typescriptreact = { { 'prettierd', 'prettier' } },
					javascript = { { 'prettierd', 'prettier' } },
					typescript = { { 'prettierd', 'prettier' } },
					svelte = { { 'prettierd', 'prettier' } },
					css = { { 'prettierd', 'prettier' } },
					html = { { 'prettierd', 'prettier' } },
					json = { { 'prettierd', 'prettier' } },
					yaml = { { 'prettierd', 'prettier' } },
					markdown = { { 'prettierd', 'prettier' } },
					graphql = { { 'prettierd', 'prettier' } },

					lua = { 'stylua' },
				},
				format_on_save = {
					lsp_fallback = false,
					async = false,
					timeout_ms = 500,
				},
			}

			vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
				conform.format {
					lsp_fallback = false,
					async = false,
					timeout_ms = 500,
				}
			end, { desc = 'Format file or range (in visual mode)' })
		end,
	},

	-- Make background transparent
	{ 'xiyaowong/transparent.nvim' },

	{
		'windwp/nvim-ts-autotag',
		ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
		config = function()
			require('nvim-ts-autotag').setup()
		end,
	},

	{
		'romgrk/barbar.nvim',
		config = function()
			require('vim.keymap').set('n', '<leader>b1', '<cmd>BufferGoto 1<CR>', { desc = 'Tab 1' })
			require('vim.keymap').set('n', '<leader>b2', '<cmd>BufferGoto 2<CR>', { desc = 'Tab 2' })
			require('vim.keymap').set('n', '<leader>b3', '<cmd>BufferGoto 3<CR>', { desc = 'Tab 3' })
			require('vim.keymap').set('n', '<leader>b4', '<cmd>BufferGoto 4<CR>', { desc = 'Tab 4' })
			require('vim.keymap').set('n', '<leader>b5', '<cmd>BufferGoto 5<CR>', { desc = 'Tab 5' })
			require('vim.keymap').set('n', '<leader>b6', '<cmd>BufferGoto 6<CR>', { desc = 'Tab 6' })
			require('vim.keymap').set('n', '<leader>b7', '<cmd>BufferGoto 7<CR>', { desc = 'Tab 7' })
			require('vim.keymap').set('n', '<leader>b8', '<cmd>BufferGoto 8<CR>', { desc = 'Tab 8' })
			require('vim.keymap').set('n', '<leader>b9', '<cmd>BufferGoto 9<CR>', { desc = 'Tab 9' })
			require('vim.keymap').set('n', '<leader>b0', '<cmd>BufferLast<CR>', { desc = 'Last Tab' })
		end,
	},
}
