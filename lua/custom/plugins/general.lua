return {
  -- Colors
  { 'rose-pine/neovim' },
  { 'morhetz/gruvbox' },
  { 'ayu-theme/ayu-vim' },
  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'moonfly'
    end,
  },

  -- Switch transparent background on and off
  -- :TransparentToggle
  { 'xiyaowong/transparent.nvim' },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'moonfly',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
}
