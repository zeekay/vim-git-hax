if exists('g:loaded_git_hax') || &cp
    finish
endif
let g:loaded_git_hax = 1

func! s:Glog(bang, ...)
    if a:bang == '!'
        let bang = ''
    else
        let bang = '!'
    endif

    exe 'Gitv'.bang.' '.join(a:000)
endf

augroup fugitive_patch
    autocmd!
    autocmd User Fugitive command! -buffer -nargs=* -bang Glog call s:Glog('<bang>', <f-args>)
augroup END
