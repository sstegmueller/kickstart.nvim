return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'olimorris/neotest-phpunit',
    'marilari88/neotest-vitest',
  },
  config = function()
    local dap = require 'dap'
    require('neotest').setup {
      adapters = {
        require 'neotest-phpunit' {
          env = {
            XDEBUG_CONFIG = 'idekey=neotest',
          },
          dap = dap.configurations.php,
          phpunit_cmd = function()
            return 'bin/'
          end,
        },
        require 'neotest-vitest' {},
      },
    }
  end,
  keys = {
    {
      '<leader>td',
      function()
        require('neotest').run.run { strategy = 'dap' }
      end,
      desc = '[T]est [D]ebug function',
    },
    {
      '<leader>tr',
      function()
        require('neotest').run.run()
      end,
      desc = '[T]est [R]un function',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = '[T]est [S]ummary toggle',
    },
    {
      '<leader>to',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = '[T]est toggle [O]utput pannel',
    },
  },
}
