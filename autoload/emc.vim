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

function! emc#iBegLine()
    call cursor(0, 1)
    let ret = search('\v\S', 'c')
endfunction

function! emc#iKillLine()
    let line = getline('.')
    let g:emcReg = line
    call setline('.', emc#h#firstNonSpace(line))
endfunction
