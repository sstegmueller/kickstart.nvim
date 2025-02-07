return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require 'dap'
    dap.adapters.php = {
      type = 'executable',
      command = 'node',
      args = { '/usr/lib/node_modules/php-debug/out/phpDebug.js' },
    }

    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Portal',
        port = 9003,
        cwd = 'app',
        pathMappings = {
          ['/app'] = '/home/max/PhpstormProjects/portal/',
        },
      },
    }
  end,
  keys = {
    {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
      desc = 'Start/Continue debuggin session',
    },
    {
      '<leader>dt',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Toggel breakpoint',
    },
    {
      '<leader>dsi',
      function()
        require('dap').step_into()
      end,
      desc = 'Step into',
    },
    {
      '<leader>dso',
      function()
        require('dap').step_out()
      end,
      desc = 'Step out',
    },
    {
      '<leader>dsn',
      function()
        require('dap').step_into()
      end,
      desc = 'Step over',
    },
  },
}
