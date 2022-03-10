vim.g.mapleader = ' '

-- dein
if vim.fn.has('mac') then
    vim.api.nvim_set_var('python3_host_prog', vim.fn.expand('/usr/local/bin/python3'))
elseif vim.fn.has('unix') then
    vim.api.nvim_set_var('python3_host_prog', vim.fn.expand('/sbin/python'))
elseif vim.fn.has('win64') or vim.fn.has('win32') then
    vim.api.nvim_set_var('python3_host_prog', vim.fn.expand('~/scoop/apps/python/current/python.exe'))
end

if vim.opt.compatible:get() == true then
    -- Be iMproved
    vim.opt.compatible = false
end

local dein_dir = vim.env.HOME .. '/.cache/dein'
local dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'

if not string.match(table.concat(vim.opt_global.runtimepath:get()), 'dein.vim') then
    if vim.fn.isdirectory(dein_repo_dir) then
        os.execute('git clone https://github.com/Shougo/dein.vim ' .. dein_repo_dir)
    end

    if vim.fn.has('win64') or vim.fn.has('win32') then
        vim.opt_global.runtimepath:append(dein_repo_dir)
    else
        vim.opt_global.runtimepath:append(vim.fn.fnamemodify(dein_repo_dir, ':p'))
    end
end

if vim.fn['dein#load_state'](dein_dir) == 1 then
    vim.fn['dein#begin'](dein_dir)

    vim.api.nvim_set_var('rc_dir', vim.fn.expand("~/.config/nvim"))
    vim.api.nvim_set_var('toml', vim.api.nvim_get_var('rc_dir') .. '/dein.toml')

    vim.fn['dein#load_toml'](vim.api.nvim_get_var('toml'), {lazy = 0})

    vim.fn['dein#end']()
    vim.fn['dein#save_state']()
end

-- required
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

if not vim.fn['dein#check_install']() == 1 then
    vim.fn['dein#install']()
end

-- load vimrc files
vim.opt_global.runtimepath:append(vim.env.HOME .. '/.config.nvim')
vim.cmd('runtime! rc/*.vim')
