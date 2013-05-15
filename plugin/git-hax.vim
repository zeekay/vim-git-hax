if exists('g:loaded_git_hax') || &cp
    finish
endif
let g:loaded_git_hax = 1

func! s:Glog(bang, ...)
    exe 'Gitv'.a:bang.' '.join(a:000)
endf

augroup fugitive_patch
    autocmd!
    autocmd User Fugitive command! -buffer -nargs=* -bang Glog call s:Glog('<bang>', <f-args>)
augroup END
