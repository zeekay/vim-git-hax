func! git_hax#gitv_wrapper(bang, ...)
    if a:bang == '!'
        let bang = ''
    else
        let bang = '!'
    endif

    exe 'Gitv'.bang.' '.join(a:000)
endf
