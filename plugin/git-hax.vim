if exists('g:loaded_git_hax') || &cp
    finish
endif
let g:loaded_git_hax = 1

augroup fugitive_patch
    autocmd!
    autocmd User Fugitive command! -buffer -nargs=* -bang Glog call git_hax#gitv_wrapper('<bang>', <f-args>)
augroup END

let g:Gitv_WipeAllOnClose = 1

nmap <leader>gl :Glog --all<cr>
vmap <leader>gl :Glog --all<cr>
nmap <leader>gL :Glog! --all<cr>
