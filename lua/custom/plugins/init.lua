return {
  vim.keymap.set('i', '<C-c>', '<Esc>'),

  -- Move Selected Text Up/Down
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv"),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv"),

  vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz'),
  vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz'),
  vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz'),
  vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz'),

  -- Map <leader>p in visual mode to replace selected text with previously yanked content.
  vim.keymap.set('x', '<leader>p', [["_dP]]),
}
