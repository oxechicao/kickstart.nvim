local keyd = '<leader>N'
return {
  { 'nvim-lua/plenary.nvim' },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      vim.keymap.set('n', keyd .. 'ha', function()
        harpoon:list():add()
      end, { desc = '[N]avigation - [h]arpoon [a]dding file' })
      vim.keymap.set('n', keyd .. 'he', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[N]avigation - [H]arpoon [e]xplorer' })

      for i = 1, 9 do
        vim.keymap.set('n', keyd .. i, function()
          harpoon:list():select(i)
        end, { desc = '[N]avigation to file ' .. i .. ' in harpoon' })
      end
    end,
  },
}
