inoremap <silent> <Plug>emc_iForwardWord <C-O>:<C-U>call emc#iForwardWord()<CR>
inoremap <silent> <Plug>emc_iBackWord <C-O>:<C-U>call emc#iBackWord()<CR>
inoremap <silent> <Plug>emc_iBegLine <C-O>:<C-U>call emc#iBegLine()<CR>
inoremap <silent> <Plug>emc_iKillLine <C-O>:<C-U>call emc#iKillLine()<CR>
inoremap <silent> <Plug>emc_iKillBackWord <C-O>:<C-U>call emc#iKillBackWord()<CR>
inoremap <silent> <Plug>emc_iYank <C-O>:<C-U>call emc#iYank()<CR>

cnoremap <Plug>emc_cForwardWord <C-\>eemc#cForwardWord()<CR>
cnoremap <Plug>emc_cBackWord <C-\>eemc#cBackWord()<CR>
cnoremap <Plug>emc_cBegLine <C-\>eemc#cBegLine()<CR>
cnoremap <Plug>emc_cKillLine <C-\>eemc#cKillLine()<CR>
cnoremap <Plug>emc_cKillBackWord <C-\>eemc#cKillBackWord()<CR>
cnoremap <Plug>emc_cYank <C-\>eemc#cYank()<CR>
