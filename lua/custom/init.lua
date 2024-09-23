return {
  vim.keymap.set('i', '<C-c>', '<Esc>'),

  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv"),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv"),

  vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz'),
  vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz'),
  vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz'),
  vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz'),

  -- Map <leader>p in visual mode to replace selected text with previously yanked content.
  vim.keymap.set('x', '<leader>p', [["_dP]]),
  {

    function()
      if vim.g.neovide then
        -- Print version just for testing
        vim.print(vim.g.neovide_version)

        -- Reduce Trail size
        vim.g.neovide_cursor_trail_size = 0

        vim.g.neovide_cursor_animation_length = 0
        vim.g.neovide_cursor_antialiasing = true

        -- Nice VFX effect when you switching between modes
        vim.g.neovide_cursor_vfx_mode = 'wireframe'

        -- Scale font at runtime
        vim.g.neovide_scale_factor = 1.0
        local change_scale_factor = function(delta)
          vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
        end
        vim.keymap.set('n', '<Alt-+>', function()
          change_scale_factor(1.25)
        end)
        vim.keymap.set('n', '<Alt-*>', function()
          change_scale_factor(1 / 1.25)
        end)
      end
    end,
  },
}
