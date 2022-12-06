vim.keymap.set('n', '<space>t',
  function()
    vim.cmd('Deol -split=floating -winwidth=120')
  end
)
