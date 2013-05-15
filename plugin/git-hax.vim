if exists('g:loaded_git_hax') || &cp
    finish
endif
let g:loaded_git_hax = 1

func! s:Gitv(bang, ...)
    if a:bang == '!'
        let bang = ''
    else
        let bang = '!'
    endif

    exe 'Gitv'.bang.' '.join(a:000)
endf

augroup fugitive_patch
    autocmd!
    autocmd User Fugitive command! -buffer -nargs=* -bang Glog call s:Gitv('<bang>', <f-args>)
augroup END

let g:Gitv_WipeAllOnClose = 1

nmap <leader>gl :Glog --all<cr>
vmap <leader>gl :Glog --all<cr>
nmap <leader>gL :Glog! --all<cr>
