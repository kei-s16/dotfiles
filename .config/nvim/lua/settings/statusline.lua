-- Left side
vim.opt.statusline:append('%F')
vim.opt.statusline:append('%m')
vim.opt.statusline:append('%r')
vim.opt.statusline:append('%h')
vim.opt.statusline:append('%w')

-- Right side
vim.opt.statusline:append('%=')
vim.opt.statusline:append('[%{&fileencoding}]')
vim.opt.statusline:append('[L:%l/%L]')
