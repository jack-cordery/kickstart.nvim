return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    -- accessing the harpoon:list()
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'mark current buffer in harpoon (appended in the list)' })

    -- clearing the harpoon:list()
    vim.keymap.set('n', '<leader>ua', function()
      harpoon:list():clear()
    end, { desc = 'clear harpoon marks' })

    -- navigating through marked files (QWERTY)
    vim.keymap.set('n', '<C-1>', function()
      harpoon:list():select(1)
    end) -- one
    vim.keymap.set('n', '<C-2>', function()
      harpoon:list():select(2)
    end) -- two
    vim.keymap.set('n', '<C-3>', function()
      harpoon:list():select(3)
    end) -- three (next to 'o')
    vim.keymap.set('n', '<C-4>', function()
      harpoon:list():select(4)
    end) -- four (close to 't')

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

    vim.keymap.set('n', '<C-e>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end,
}
