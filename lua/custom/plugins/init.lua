-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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

	-- TODO: Add New Theme, Add Autoclosing html tags which will work in tsx files
}
