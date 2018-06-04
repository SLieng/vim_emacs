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
    if line != ''
        let g:emcReg = line
    endif
    call setline('.', emc#h#firstNonSpace(line))
endfunction

function! emc#iKillBackWord()
    let cur = getcurpos()
    let line = getline('.')
    let newPos = emc#h#prevWord(cur[2], line)
    let n = strchars(line)
    if cur[2] == n
        let g:emcReg = line[newPos-1:cur[2]]
        call feedkeys(repeat("\<BS>",  cur[2] - newPos + 1))
    else
        let g:emcReg = line[newPos-1:cur[2]-1]
        call feedkeys(repeat("\<BS>",  cur[2] - newPos))
    endif
endfunction
