return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  keys = {
    { '<leader>ld', '<cmd>DiffviewOpen<CR>',          desc = 'Open Git Diff View' },
    { '<leader>lq', '<cmd>DiffviewClose<CR>',         desc = 'Quit Diff View' },
    { '<leader>lh', '<cmd>DiffviewFileHistory<CR>',   desc = 'View Git File History' },
    { '<leader>lf', '<cmd>DiffviewFileHistory %<CR>', desc = 'View Current File History' },
    { '<leader>lt', '<cmd>DiffviewToggleFiles<CR>',   desc = 'Toggle Diff Files Panel' },
    { '<leader>lo', '<cmd>DiffviewFocusFiles<CR>',    desc = 'Focus Diff Files Panel' },
    { '<leader>lx', '<cmd>DiffviewClose<CR>',         desc = 'Close Diff View' },
  },
  config = function()
    require('diffview').setup({
      use_icons = true, -- If your terminal supports it
    })
  end,
}
