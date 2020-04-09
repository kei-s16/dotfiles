augroup setFileTypeIndent
	autocmd!
	autocmd FileType python setlocal expandtab tabstop=4 softtabstop shiftwidth=4
	autocmd FileType php setlocal expandtab tabstop=4 softtabstop shiftwidth=4
augroup END

augroup runPython
	autocmd!
	autocmd FileType python nnoremap <buffer> T :term python3 %<CR>
augroup END

augroup launchPyls
	autocmd!
	autocmd FileType python :call lsp#enable()
	autocmd FileType python setlocal omnifunc=lsp#complete
augroup END
