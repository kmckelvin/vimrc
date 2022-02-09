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

" colorscheme
syntax on
colorscheme onedark

" line highlighting
set cursorline
" hi CursorLine term=bold cterm=bold ctermbg=233
hi LineNr guifg=lightblue

" indentation and whitespace
autocmd BufNewFile,BufReadPost * set ai ts=2 sw=2 sts=2 et
autocmd BufNewFile,BufReadPost *.go setlocal ts=4 noet sw=4 sts=4
autocmd BufEnter *.md setlocal wrap linebreak
autocmd BufWritePre * %s/\s\+$//e " truncate trailing whitespace

" follow the active file in NERDTree
autocmd BufEnter * call FollowNERDTree()

" embrace it, don't fight it
command! W w
command! Wa wall

command! Wq wq
command! Wqa wqall

command! Q q
command! Qa qall

function! FollowNERDTree()
  if (&modifiable && g:NERDTree.IsOpen() && expand('%:p')[0] == "/" && expand('%')[0:9] != "NERD_tree_" && expand('%:t') != "COMMIT_EDITMSG")
    NERDTreeFind
    wincmd p
  endif
endfunction

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
