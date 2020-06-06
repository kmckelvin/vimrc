" embrace it, don't fight it
command! W w
command! Wa wall

command! Wq wq
command! Wqa wqall

command! Q q
command! Qa qall

" find files
nmap <silent> <c-p> :FZF<CR>

" j and k navigate through wrapped lines
nmap k gk
nmap j gj

" navigate panes with <c-hhkl>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" navigate tabs
nmap <leader>t] :tabnext<CR>
nmap <leader>t[ :tabprevious<CR>

nnoremap <esc><esc> :noh<CR>

" files
map <leader>ft :NERDTreeToggle<CR>
map <leader>ff :NERDTreeFind<CR>
map <leader>fs :w<CR>

" git
map <leader>gs :Git<CR>
map <leader>gc :Gcommit<CR>

" sessions
nmap <leader>sc :NERDTreeClose<CR>:mksession!<CR>:qa!<CR>
nmap <leader>sl :source Session.vim<CR>:silent exec "!rm Session.vim"<CR>

" test runners
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" Formatting selected code.
xmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
xmap <leader>ca  <Plug>(coc-codeaction-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)

nmap <leader>rn <Plug>(coc-rename)
