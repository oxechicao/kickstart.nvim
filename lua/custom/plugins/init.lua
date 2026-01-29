vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    -- Pequeno delay pode ser necessário se o plugin nativo ainda estiver processando
    vim.schedule(function()
      if vim.b.editorconfig then
        -- Sua lógica personalizada aqui
        local line_length = vim.b.editorconfig['max_line_length']
        if line_length then
          vim.wo.colorcolumn = tostring(line_length)
        else
          vim.wo.colorcolumn = ''
        end
      else
        vim.wo.colorcolumn = '120'
      end
    end)
  end,
})

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

return {
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G' },
    keys = {
      { '<leader>gs', ':Git<CR>', desc = 'Git Status' },
    },
  },
  --- Rose Pine Theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd 'colorscheme rose-pine'
    end,
  },
  --- Better undo history visualizer
  {
    'jiaoshijie/undotree',
    opts = {
      -- your options
    },
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
}
