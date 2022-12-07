local keymap = require('utils.keymap').keymap

vim.fn['skkeleton#config']{
  globalJisyo = '~/.eskk/SKK-JISYO.L',
  userJisyo = '~/.eskk/USER.L'
}

keymap('i', '<C-j>', '<Plug>(skkeleton-enable)')
keymap('c', '<C-j>', '<Plug>(skkeleton-enable)')
