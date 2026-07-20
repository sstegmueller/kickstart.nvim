return {
  'kndndrj/nvim-dbee',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup {
      sources = {
        require('dbee.sources').MemorySource:new {
          {
            id = 'local-desire',
            name = 'Local Desire',
            type = 'postgres',
            url = 'postgresql://desire:root@localhost:5432/desire?sslmode=disable',
          },
          {
            id = 'local-daphne',
            name = 'Local Daphne',
            type = 'mysql',
            url = 'root:root@tcp(localhost:3306)/daphne',
          },
          {
            id = 'testing-nsp',
            name = 'Testing NSP',
            type = 'mysql',
            url = 'decixdb:<password>@tcp(mysql-dev.de-cix.net:3306)/testing-nsp',
          },
          {
            id = 'peering-service-provisioning',
            name = 'Peering Service Provisioning',
            type = 'postgres',
            url = 'postgresql://peering-service-provisioning:root@localhost:5434/peering-service-provisioning?sslmode=disable',
          },
          {
            id = 'portal.local',
            name = 'Portal Localhost',
            type = 'postgres',
            url = 'postgresql://db_user:db_password@localhost:5433/db_name?sslmode=disable',
          },
        },
      },
    }
  end,
  keys = {
    {
      '<leader>dd',
      function()
        require('dbee').open()
      end,
      desc = '[D]atabase Open',
    },
    {
      '<leader>dt',
      function()
        require('dbee').toggle()
      end,
      desc = '[D]atabase [T]oggle',
    },
    {
      '<leader>dq',
      function()
        require('dbee').close()
      end,
      desc = '[D]atabase [Q]uit',
    },
    {
      '<leader>de',
      function()
        local query = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')
        require('dbee').execute(query)
      end,
      desc = '[D]atabase [E]xecute buffer',
    },
    {
      '<leader>de',
      function()
        local start_line = vim.fn.line('v')
        local end_line = vim.fn.line('.')

        if start_line > end_line then
          start_line, end_line = end_line, start_line
        end

        local query = table.concat(vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false), '\n')
        require('dbee').execute(query)
      end,
      mode = 'v',
      desc = '[D]atabase [E]xecute selection',
    },
  },
}

