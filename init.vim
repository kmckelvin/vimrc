" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'janko/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jwhitley/vim-matchit'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

let mapleader=" "
map <leader>vs :source ~/code/vimrc/init.vim<CR>
map <leader>vi :tabe ~/code/vimrc/init.vim<CR>

set hidden
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set incsearch
set hlsearch
noh " clear the initial highlight after sourcing
set ignorecase smartcase
set number
set relativenumber
set scrolloff=5
set nocompatible
set noswapfile
set nobackup
set nowritebackup
set nowrap
set wildmenu
set wildmode=longest,list
set mouse=a
set lazyredraw
set laststatus=2
set showmatch
set splitright
set splitbelow

set statusline=
set statusline+=%{FugitiveStatusline()}
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %p%%
set statusline+=\ %l:%c

" BEGIN intellisense config

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set updatetime=300
set shortmess+=c
set signcolumn=yes
set cmdheight=1

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
"if exists('*complete_info')
  "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
  "imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
xmap <leader>ca  <Plug>(coc-codeaction-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)

" END intellisense config

" line highlighting
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=233

" colorscheme
syntax on
colorscheme onedark

" indentation and whitespace
autocmd BufNewFile,BufReadPost * set ai ts=2 sw=2 sts=2 et
autocmd BufNewFile,BufReadPost *.go setlocal ts=4 noet sw=4 sts=4
autocmd BufEnter *.md setlocal wrap linebreak
autocmd BufWritePre * %s/\s\+$//e " truncate trailing whitespace

" follow the active file in NERDTree
autocmd BufEnter * call FollowNERDTree()

function! FollowNERDTree()
  if (&modifiable && g:NERDTree.IsOpen() && expand('%:p')[0] == "/" && expand('%')[0:9] != "NERD_tree_" && expand('%:t') != "COMMIT_EDITMSG")
    NERDTreeFind
    wincmd p
  endif
endfunction

" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0

let test#javascript#ava#file_pattern = '.ava.ts'

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

map <leader>ft :NERDTreeToggle<CR>
map <leader>ff :NERDTreeFind<CR>
map <leader>fs :w<CR>

map <leader>gs :Git<CR>
map <leader>gc :Gcommit<CR>

nmap <leader>sc :NERDTreeClose<CR>:mksession!<CR>:qa!<CR>
nmap <leader>sl :source Session.vim<CR>:silent exec "!rm Session.vim"<CR>

" vim-test execution
let test#strategy = "neovim"

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
