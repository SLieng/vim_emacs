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

    if x > 1
        let x -= 2
    endif

    while x > 0 && strcharpart(s, x, 1) !~ '\S'
        let x -= 1
    endwhile

    while x > 0 && strcharpart(s, x, 1) =~ '\S'
        let m = x + 1
        let x -= 1
        if x == 0
            let m = 0
        endif
    endwhile

    return m
endfunction

function! emc#h#firstNonSpace(line)
    return substitute(a:line, '\v^(\s*).*', '\1', '/g')
endfunction
