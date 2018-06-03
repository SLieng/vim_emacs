function! emc#iForwardWord()
    let cur = getcurpos()
    let line = getline('.')
    let cur[2] = emc#h#nextWord(cur[2], line)
    call setpos('.', cur)
endfunction

function! emc#iBackWord()
    let cur = getcurpos()
    let line = getline('.')
    let cur[2] = emc#h#prevWord(cur[2], line)
    call setpos('.', cur)
endfunction

function! emc#iKillLine()
    let line = getline('.')
    let nonSpacePos = emc#h#firstNonSpace(line)
    call setline('.', repeat(' ', nonSpacePos))

    " normal ^"zd$' 
    " let g:emacs_reg = getreg('z')
endfunction
