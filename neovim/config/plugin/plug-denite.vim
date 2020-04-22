nmap <silent> <leader>o :<C-u>Denite file/rec<CR>
nmap <silent> <leader>r :<C-u>Denite file/old<CR>
nmap <silent> <leader>b :<C-u>Denite buffer<CR>
nmap <silent> <leader>f :<C-u>Denite line<CR>
nmap <silent> <leader>p :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

let s:denite_win_width_percent = 0.8
let s:denite_win_height_percent = 0.8
