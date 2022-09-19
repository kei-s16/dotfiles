-- global_options
vim.opt.backspace = {'indent','eol','start'}
vim.opt.ruler = true
vim.opt.listchars = 'tab:>-,extends:<,trail:-,eol:<'
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.opt.showcmd = true
vim.opt.title = true
vim.opt.hidden = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = {'utf-8','iso-20222-jp','euc-jp,sjis'}
vim.opt.fileformats = {'unix','dos','mac'}
vim.opt.ambiwidth = 'double'
vim.opt.showbreak = [[->\ ]]
vim.opt.completeopt = 'preview'
vim.opt.inccommand = 'split'

-- buffer_options
vim.opt.tabstop = 8
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.formatoptions:append('mM')

-- window_options
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.wrap = true
vim.opt.foldmethod = 'indent'
