return {
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		requires = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			local harpoon = require 'harpoon'

			-- REQUIRED
			harpoon:setup {}
			-- REQUIRED

			vim.keymap.set('n', '<leader>l', function()
				harpoon:list():append()
			end, { desc = 'Add current buffer to Harpoon list' })

			vim.keymap.set('n', '<C-e>', function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = 'Toggle Harpoon list' })

			vim.keymap.set('n', '<A-1>', function()
				harpoon:list():select(1)
			end, { desc = 'Select first buffer in Harpoon list' })

			vim.keymap.set('n', '<A-2>', function()
				harpoon:list():select(2)
			end, { desc = 'Select second buffer in Harpoon list' })

			vim.keymap.set('n', '<A-3>', function()
				harpoon:list():select(3)
			end, { desc = 'Select third buffer in Harpoon list' })

			vim.keymap.set('n', '<A-4>', function()
				harpoon:list():select(4)
			end, { desc = 'Select fourth buffer in Harpoon list' })

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set('n', '<leader>,', function()
				harpoon:list():prev()
			end, { desc = 'Select previous buffer in Harpoon list' })

			vim.keymap.set('n', '<leader>.', function()
				harpoon:list():next()
			end, { desc = 'Select next buffer in Harpoon list' })
		end,
	},
}
