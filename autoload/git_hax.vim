" wraps gitv command and reverses bang
func! git_hax#gitv_wrapper(bang, ...)
    if a:bang == '!'
        let bang = ''
    else
        let bang = '!'
    endif

    exe 'Gitv'.bang.' '.join(a:000)
endf

" This hack ensures I don't automatically commit a merge
func! git_hax#git_commit_hack()
    " Jump to first comment
    call search('^#', 'w')
    let linenr = line('.')
    " write partial file (omitting non-commented lines)
    exe linenr . ',$w!'
    normal gg
endf

func! git_hax#close_diff()
    if bufwinnr(g:_commitnr) == -1
        unlet g:_commitnr
        q
    endif
endf

func! git_hax#git_show_diff()
    " fugitive's Gstatus window is a preview window, we don't show the diff automatically there.
    " Through some magic I do not understand we can be called multiple
    " times, avoid that.
    if !eval('&pvw') && !exists('g:_commitnr')
        let g:_commitnr = bufnr('%')
        vnew
        silent! 0r!git diff --cached
        normal gg
        setl ft=diff
        setl readonly
        setl noswapfile
        setl nobuflisted
        setl buftype=nofile
        setl bufhidden=delete
        " Close if the diff is empty
        if line('$') == 1 && getline(1) == ''
            q
        else
            au WinEnter <buffer> call git_hax#close_diff()
            exe bufwinnr(g:_commitnr) . "wincmd w"
        endif
    endif
endf
