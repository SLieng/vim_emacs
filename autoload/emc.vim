function! emc#iForwardWord()
    let pos = emc#h#getPos()
    let line = getline('.')
    let newPos = emc#h#nextWord(pos, line)
    call emc#h#moveCurTo(line, pos, newPos)
endfunction

function! emc#iBackWord()
    let pos = emc#h#getPos()
    let line = getline('.')
    let newPos = emc#h#prevWord(pos, line)
    call emc#h#moveCurTo(line, pos, newPos)
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
    let pos = emc#h#getPos()
    let line = getline('.')
    let newPos = emc#h#prevWord(pos, line)
    let cut = strcharpart(line, newPos-1, pos-newPos+1)
    if cut != ''
        let g:emcReg = cut
    endif
    let bef = strcharpart(line, 0, newPos-1)
    let aft = strcharpart(line, pos)
    call emc#h#moveCurTo(line, pos, newPos)
    call setline('.', bef . aft)
endfunction

function! emc#iYank()
    let line = getline('.')
    let pos = emc#h#getPos()
    let bef = strcharpart(line, 0, pos)
    let aft = strcharpart(line, pos)
    let newLine = bef . g:emcReg . aft
    call setline('.', newLine)
    call emc#h#moveCurTo(newLine, pos, pos + strchars(g:emcReg))
endfunction

function! emc#cForwardWord()
    let pos = emc#h#getCmdPos()
    let line = getcmdline()
    let newPos = emc#h#nextWord(pos, line)
    call emc#h#moveCmdTo(line, pos, newPos)
    return line
endfunction

function! emc#cBackWord()
    let pos = emc#h#getCmdPos()
    let line = getcmdline()
    let newPos = emc#h#prevWord(pos, line)
    call emc#h#moveCmdTo(line, pos, newPos)
    return line
endfunction

function! emc#cBegLine()
    call setcmdpos(1)
    return getcmdline()
endfunction

function! emc#cKillLine()
    let line = getcmdline()
    if line != ''
        let g:emcReg = line
    endif
    return ''
endfunction

function! emc#cKillBackWord()
    let pos = emc#h#getCmdPos()
    let line = getcmdline()
    let newPos = emc#h#prevWord(pos, line)
    let n = strchars(line)
    let cut = strcharpart(line, newPos-1, pos)
    if cut != ''
        let g:emcReg = cut
    endif
    let bef = strcharpart(line, 0, newPos-1)
    let aft = strcharpart(line, pos)
    call emc#h#moveCmdTo(line, pos, newPos)
    return bef . aft
endfunction

function! emc#cYank()
    let line = getcmdline()
    let pos = emc#h#getCmdPos()
    let bef = strcharpart(line, 0, pos)
    let aft = strcharpart(line, pos)
    let newLine = bef . g:emcReg . aft
    call emc#h#moveCmdTo(line . g:emcReg, pos, pos + strchars(g:emcReg))
    return newLine
endfunction
