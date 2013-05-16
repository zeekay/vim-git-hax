if exists('g:loaded_git_hax') || &cp
    finish
endif
let g:loaded_git_hax = 1

augroup git_hax
    autocmd!
    autocmd FileType git setl foldlevel=99
    autocmd FileType gitcommit call git_hax#git_commit_hack()
    autocmd FileType gitcommit call git_hax#git_show_diff()
    autocmd FileType gitcommit setl textwidth=80
    autocmd User Fugitive command! -buffer -nargs=* -range -bang Glog call git_hax#gitv_wrapper('<bang>', <line1>, <line2>, <f-args>)
augroup END

nnoremap <leader>gl :Glog --all<cr>
vnoremap <leader>gl :Glog --all<cr>
nnoremap <leader>gL :Glog! --all<cr>
