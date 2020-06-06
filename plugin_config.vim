let test#javascript#ava#file_pattern = '\v.*\.ava\.(t|j)s(x?)$'

" NERDTree
let NERDTreeShowHidden=1

" Go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command='goimports'
let g:go_doc_keywordprg_enabled = 0
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1

" vim-test execution
let test#strategy = "neovim"
