function! emc#h#nextWord(x, line)
    let x = a:x
    let s = a:line
    let n = strchars(s)

    while x < n && strcharpart(s, x, 1) !~ '\S'
        let x += 1
    endwhile

    while x < n && strcharpart(s, x, 1) =~ '\S'
        let x += 1
    endwhile

    return x + 2
endfunction

function! emc#h#prevWord(x, line)
    let x = a:x
    let s = a:line

    let m = x

    while x > 0 && strcharpart(s, x-2, 1) =~ '\s'
        let x -= 1
    endwhile

    while x > 0 && strcharpart(s, x-2, 1) =~ '\S'
        let x -= 1
        let m = x
        if x == 0
            let m = 0
        endif
    endwhile

    return m
endfunction

function! emc#h#firstNonSpace(line)
    return substitute(a:line, '\v^(\s*).*', '\1', '/g')
endfunction

" Differs from getpos as counts chars instead of bytes and starts from 1
function! emc#h#getPos()
    return strchars((getline('.') . " ")[:getcurpos()[2] - 1])
endfunction

" Differs from getcmdpos as counts chars instead of bytes and starts from 1
function! emc#h#getCmdPos()
    return strchars((getcmdline() . " ")[:getcmdpos() - 1])
endfunction

function! emc#h#moveCurTo(line, x, y)
    if a:x < a:y
        let bytes = strlen(strcharpart(a:line, a:x-1, a:y-a:x))
    else
        let bytes = -strlen(strcharpart(a:line, a:y-1, a:x-a:y))
    endif
    let cur = getcurpos()
    let cur[2] += bytes
    call setpos('.', cur)
endfunction

function! emc#h#moveCmdTo(line, x, y)
    if a:x < a:y
        let bytes = strlen(strcharpart(a:line, a:x-1, a:y-a:x))
    else
        let bytes = -strlen(strcharpart(a:line, a:y-1, a:x-a:y))
    endif
    let pos = getcmdpos()
    let pos += bytes
    call setcmdpos(pos)
endfunction
