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
    autocmd User Fugitive command! -buffer -nargs=* -bang Glog call git_hax#gitv_wrapper('<bang>', <f-args>)
augroup END

" Gitv {{{
    let g:Gitv_WipeAllOnClose = 1
    let g:Gitv_OpenPreviewOnLaunch = 1
    let g:Gitv_DoNotMapCtrlKey = 1
" }}}

" Mappings {{{
    nnoremap <leader>gl :Glog --all<cr>
    vnoremap <leader>gl :Glog --all<cr>
    nnoremap <leader>gL :Glog! --all<cr>
" }}}

