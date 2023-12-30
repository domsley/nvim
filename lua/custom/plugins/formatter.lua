return {
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
}
