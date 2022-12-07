vim.g.mapleader = ' '

-- for windows
if vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 then
    vim.opt.shellcmdflag = "-c"
end

-- dein
require('plugins.dein')

-- load lua files
require('settings.options')
require('settings.statusline')

-- load vimrc files
vim.opt_global.runtimepath:append(vim.env.HOME .. '/.config/nvim')
