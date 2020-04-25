if empty(glob('~/.vim/autoload/plug.vim'))
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'fatih/vim-go'
Plug 'janko/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jwhitley/vim-matchit'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'michaeljsmith/vim-indent-object'
Plug 'preservim/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

let g:deoplete#enable_at_startup = 1
" Initialize plugin system
call plug#end()

let mapleader=" "
map <leader>vs :source ~/.vimrc<CR>
map <leader>vi :tabe ~/.vimrc<CR>

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

set statusline=
set statusline+=%{FugitiveStatusline()}
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %p%%
set statusline+=\ %l:%c

" line highlighting
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=233

" colorscheme
syntax on
colorscheme onedark

" indentation and whitespace
autocmd BufNewFile,BufReadPost * set ai ts=2 sw=2 sts=2 et
autocmd BufNewFile,BufReadPost *.go setlocal ts=4 noet sw=4 sts=4
autocmd BufWritePre * %s/\s\+$//e " truncate trailing whitespace

" follow the active file in NERDTree
autocmd BufEnter * call FollowNERDTree()

function! FollowNERDTree()
  if (&modifiable && g:NERDTree.IsOpen() && expand('%')[0:9] != "NERD_tree_" && expand('%:t') != "COMMIT_EDITMSG")
    NERDTreeFind
    wincmd p
  endif
endfunction

" language server configuration
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascriptreact': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'typescriptreact': ['javascript-typescript-stdio'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'go': ['gopls']
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'ruby': ['Gemfile'],
    \ 'javascript': ['jsconfig.json'],
    \ 'typescript': ['tsconfig.json'],
    \ 'typescriptreact': ['tsconfig.json'],
    \ }

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" NERDTree
let NERDTreeShowHidden=1

" Go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1

command! W w
command! Wa wall

command! Q q
command! Qa qall

" find files
nmap <silent> <c-p> :FZF<CR>

" navigate panes with <c-hhkl>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nnoremap <esc><esc> :noh<CR>

map <leader>ft :NERDTreeToggle<CR>
map <leader>ff :NERDTreeFind<CR>
map <leader>fs :w<CR>

map <leader>gs :Git<CR>
map <leader>gc :Gcommit<CR>

" test execution
let test#strategy = "vimterminal"

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
