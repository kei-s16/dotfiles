let mapleader="\<Space>"

" load dein.vim
if has("mac")
	let g:python3_host_prog = expand('/usr/local/bin/python3')
elseif has("unix")
	let g:python3_host_prog = expand('/sbin/python')
elseif has("win64") || has("win32")
	let g:python3_host_prog = expand('C:/Program Files/Python38/python')
endif

if &compatible
	set nocompatible	" Be iMproved
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# 'dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif

	if has("win64") || has("win32")
		execute 'set runtimepath^=' . s:dein_repo_dir
	else
		execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
	endif
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	let g:rc_dir	= expand("~/.config/nvim")
	let s:toml	= g:rc_dir . '/dein.toml'

	call dein#load_toml(s:toml,		{'lazy' : 0})

	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

" load vimrc files
set runtimepath^=~/.config/nvim
runtime! rc/*.vim
