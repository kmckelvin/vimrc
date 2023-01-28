autocmd VimEnter,BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window vi:" . fnamemodify(getcwd(), ":t"))
autocmd VimLeave * call system("tmux setw automatic-rename")
