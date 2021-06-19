augroup filetypedetect
	autocmd BufRead,BufNewFile *.tf set filetype=terraform
augroup END

augroup setFileTypeIndent
	autocmd!
	autocmd FileType python setlocal expandtab tabstop=4 softtabstop shiftwidth=4
	autocmd FileType rust setlocal expandtab tabstop=4 softtabstop shiftwidth=4
	autocmd FileType php setlocal expandtab tabstop=4 softtabstop shiftwidth=4
	autocmd FileType dockerfile setlocal expandtab tabstop=4 softtabstop shiftwidth=4
	autocmd FileType javascript setlocal expandtab tabstop=2 softtabstop shiftwidth=2
	autocmd FileType typescript* setlocal expandtab tabstop=2 softtabstop shiftwidth=2
	autocmd FileType yaml setlocal expandtab tabstop=2 softtabstop shiftwidth=2
	autocmd FileType json setlocal expandtab tabstop=2 softtabstop shiftwidth=2
	autocmd FileType markdown setlocal expandtab tabstop=2 softtabstop shiftwidth=2
	autocmd FileType terraform setlocal expandtab tabstop=2 softtabstop shiftwidth=2
augroup END

augroup runPython
	autocmd!
	autocmd FileType python nnoremap <buffer> T :term python3 %<CR>
augroup END

augroup runRust
	autocmd!
	autocmd FileType rust compiler cargo
	autocmd FileType rust nnoremap <buffer> T :make run %<CR>
augroup END

augroup launchPyls
	autocmd!
	autocmd FileType python :call lsp#enable()
	autocmd FileType python setlocal omnifunc=lsp#complete
augroup END
