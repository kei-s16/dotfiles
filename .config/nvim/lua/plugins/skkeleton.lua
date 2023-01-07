local keymap = require('utils.keymap').keymap

vim.fn['skkeleton#config']{
  globalJisyo = '~/.eskk/SKK-JISYO.L',
  userJisyo = '~/.eskk/USER.L',
  kanaTable = 'azik'
}

keymap('i', '<C-j>', '<Plug>(skkeleton-enable)')
keymap('c', '<C-j>', '<Plug>(skkeleton-enable)')
keymap('i', '<C-l>', '<Plug>(skkeleton-disable)')
keymap('c', '<C-l>', '<Plug>(skkeleton-disable)')
