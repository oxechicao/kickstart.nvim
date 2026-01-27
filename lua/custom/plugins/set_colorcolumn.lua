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
return {}
