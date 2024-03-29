let mapleader=" "

" manage vimrc
map <leader>vs :source ~/code/vimrc/init.vim<CR>
map <leader>vi :tabe ~/code/vimrc/init.vim<CR>

" find files
nmap <silent> <c-p> :FZF<CR>

" j and k navigate through wrapped lines
nmap k gk
nmap j gj

" navigate tabs
nmap <leader>t] :tabnext<CR>
nmap <leader>t[ :tabprevious<CR>

nnoremap <silent> <leader><leader> :noh<CR>

" files
map <silent> <leader>ft :NERDTreeToggle<CR>
map <silent> <leader>ff :NERDTreeFind<CR>
map <silent> <leader>fs :w<CR>

" git
map <silent> <leader>gs :Git<CR>
map <silent> <leader>gc :Git commit<CR>

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
xmap <leader>fm <Plug>(coc-format-selected)
nmap <leader>fm <Plug>(coc-format-selected)

" code actions
nmap <leader>ca <Plug>(coc-codeaction)
xmap <leader>ca <Plug>(coc-codeaction-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>cf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>gr <Plug>(coc-references)

" project wide search for current word
nmap <leader>fi :Rg <c-r>=expand("<cword>")<cr>
nmap Q :q<cr>
