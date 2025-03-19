-- Harpoon plugin for bookmarks
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon.setup()

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
    end

    vim.keymap.set('n', '<leader>sm', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[S]earch [M]arks' })

    vim.keymap.set('n', '<leader>ma', function()
      harpoon:list():add()
    end, { desc = '[M]ark [A]dd' })

    vim.keymap.set('n', '<leader>m1', function()
      harpoon:list():select(1)
    end, { desc = '[M]ark 1' })
    vim.keymap.set('n', '<leader>m2', function()
      harpoon:list():select(2)
    end, { desc = '[M]ark 2' })
    vim.keymap.set('n', '<leader>m3', function()
      harpoon:list():select(3)
    end, { desc = '[M]ark 3' })
    vim.keymap.set('n', '<leader>m4', function()
      harpoon:list():select(4)
    end, { desc = '[M]ark 4' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>mp', function()
      harpoon:list():prev()
    end, { desc = '[M]ark [P]revious' })
    vim.keymap.set('n', '<leader>mn', function()
      harpoon:list():next()
    end, { desc = '[M]ark [N]ext' })

    vim.keymap.set('n', '<leader>mm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[M]ark [M]enu' })
  end,
}
