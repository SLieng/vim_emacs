inoremap <silent> <Plug>emc_iForwardWord <C-O>:<C-U>call emc#iForwardWord()<CR>
inoremap <silent> <Plug>emc_iBackWord <C-O>:<C-U>call emc#iBackWord()<CR>
inoremap <silent> <Plug>emc_iBegLine <C-O>:<C-U>call emc#iBegLine()<CR>
inoremap <silent> <Plug>emc_iKillLine <C-O>:<C-U>call emc#iKillLine()<CR>
inoremap <silent> <Plug>emc_iKillBackWord <C-O>:<C-U>call emc#iKillBackWord()<CR>
inoremap <silent> <Plug>emc_iYank <C-O>:<C-U>call emc#iYank()<CR>

" exec 'normal "zp' 

function! CommandUKey()
    let g:emacs_reg = getcmdline()
    return ''
endfunction

function! CommandYKey()
    let cmd_line = getcmdline()
    return l:cmd_line . g:emacs_reg
endfunction

function! CommandCommaKey()
    let l:cmd_line = getcmdline()
    let g:emacs_reg = substitute(l:cmd_line, '\v^.*\s(\S+\s*)', '\1', '')
    let l:new_cmd_line = substitute(l:cmd_line, '\v^(.*\s)\S+\s*', '\1', '')

    " Only one word
    if l:new_cmd_line == l:cmd_line
        let l:new_cmd_line = ''
        let g:emacs_reg = l:cmd_line
    endif

    return l:new_cmd_line
endfunction

" Emacs Command Line Mode
cnoremap <C-W> <S-Left>
cnoremap <C-E> <S-Right>
cnoremap <C-R> <Home>

cnoremap <C-Y> <C-\>eCommandYKey()<CR>
cnoremap <C-U> <C-\>eCommandUKey()<CR>

cnoremap <C-D> <Left>
cnoremap <C-F> <Right>
cnoremap <C-G> <End>

cnoremap <C-V> <C-R>+
cnoremap <F1> <C-\>eCommandCommaKey()<CR>

cnoremap <F5> <C-X>
cnoremap <F6> <C-V>
