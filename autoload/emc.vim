function! emc#iForwardWord()
    let pos = emc#h#getPos()
    let line = getline('.')
    let newPos = emc#h#nextWord(pos, line)
    call emc#h#moveTo(pos, newPos)
endfunction

function! emc#iBackWord()
    let pos = emc#h#getPos()
    let line = getline('.')
    let newPos = emc#h#prevWord(pos, line)
    if pos == strchars(line)
        let pos += 1
    endif
    call emc#h#moveTo(pos, newPos)
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
    if pos == strchars(line)
        let pos += 1
    endif
    let cut = line[newPos-1:pos]
    if cut != ''
        let g:emcReg = cut
    endif
    call feedkeys(repeat("\<BS>",  pos - newPos))
endfunction

function! emc#iYank()
    let line = getline('.')
    let pos = emc#h#getPos()
    let newLine = line[:pos] . g:emcReg . line[pos:]
    call setline('.', newLine)
    call emc#h#moveTo(pos, pos + strchars(g:emcReg) + 1)
endfunction

function! emc#cForwardWord()
    let pos = emc#h#getCmdPos()
    let line = getcmdline()
    let newPos = emc#h#nextWord(pos, line)
    call emc#h#moveTo(pos, newPos)
    return line
endfunction

function! emc#cBackWord()
    let pos = emc#h#getCmdPos()
    let line = getcmdline()
    let newPos = emc#h#prevWord(pos, line)
    call emc#h#moveTo(pos, newPos)
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
    if pos == strchars(line)
        let pos = strchars(line)
    endif
    let cut = line[newPos-1:pos]
    if cut != ''
        let g:emcReg = cut
    endif
    call feedkeys(repeat("\<BS>",  pos - newPos))
    return getcmdline()
endfunction

function! emc#cYank()
    let line = getcmdline()
    let pos = emc#h#getCmdPos()
    let newLine = line[:pos] . g:emcReg . line[pos:]
    call emc#h#moveTo(pos, pos + strchars(g:emcReg) + 1)
    return newLine
endfunction
