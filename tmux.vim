if exists('$TMUX')
  autocmd VimEnter,VimResume,BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window vi:" . fnamemodify(getcwd(), ":t"))
  autocmd VimLeave,VimSuspend * call system("tmux setw automatic-rename; tmux rename-window zsh")
endif
