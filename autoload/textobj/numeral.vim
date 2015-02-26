" ===============================================================
" textobj-numeral - Text objects for numbers
" Version: 0.0.1
" Author: tkhren
"
" License: So-called MIT/X license {{{
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
" OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
" CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
" SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" ===============================================================

"================================================================
" Select-x-function
"================================================================

function! s:select(pattern)
    let cur_pos = getpos('.')
    if g:textobj_numeral_strict_mode
        let [lnum, cnum] = searchpos(a:pattern, 'ecW')
        if lnum == 0 || cur_pos[1] != lnum
            call setpos('.', cur_pos)
            return 0
        endif
        let end_pos = [0, lnum, cnum, 0]
        
        let [lnum, cnum] = searchpos(a:pattern, 'bcW')
        if lnum == 0 || cur_pos[1] != lnum
            call setpos('.', cur_pos)
            return 0
        endif
        let start_pos = [0, lnum, cnum, 0]
        
        if cur_pos[2] < start_pos[2] || cur_pos[2] > end_pos[2]
            call setpos('.', cur_pos)
            return 0
        endif
    else
        let [lnum, cnum] = searchpos(a:pattern, 'ecW')
        if lnum == 0
            call setpos('.', cur_pos)
            return 0
        endif
        let end_pos = [0, lnum, cnum, 0]

        let [lnum, cnum] = searchpos(a:pattern, 'bcW')
        if lnum == 0
            call setpos('.', cur_pos)
            return 0
        endif
        let start_pos = [0, lnum, cnum, 0]
    endif

    return ['v', start_pos, end_pos]
endfunction

function! textobj#numeral#select_a()
    return s:select(g:textobj_numeral_a_pattern)
endfunction

function! textobj#numeral#select_i()
    return s:select(g:textobj_numeral_i_pattern)
endfunction

function! textobj#numeral#select_digit_a()
    return s:select(g:textobj_numeral_digit_a_pattern)
endfunction

function! textobj#numeral#select_digit_i()
    return s:select(g:textobj_numeral_digit_i_pattern)
endfunction

function! textobj#numeral#select_float_a()
    return s:select(g:textobj_numeral_float_a_pattern)
endfunction

function! textobj#numeral#select_float_i()
    return s:select(g:textobj_numeral_float_i_pattern)
endfunction

function! textobj#numeral#select_hex_a()
    return s:select(g:textobj_numeral_hex_a_pattern)
endfunction

function! textobj#numeral#select_hex_i()
    return s:select(g:textobj_numeral_hex_i_pattern)
endfunction


"================================================================
" Move-x-function
"================================================================

function! s:move(pattern, direction)
    let flag = get({
    \   'n': 'W',
    \   'p': 'bW',
    \ }, a:direction)

    let [lnum, cnum] = searchpos(a:pattern, flag)
    if lnum == 0
        return 0
    endif
    let start_pos = [0, lnum, cnum, 0]

    return ['v', start_pos, start_pos]
endfunction

function! textobj#numeral#move_n()
    return s:move(g:textobj_numeral_i_pattern, 'n')
endfunction

function! textobj#numeral#move_p()
    return s:move(g:textobj_numeral_i_pattern, 'p')
endfunction

function! textobj#numeral#move_N()
    return s:move(g:textobj_numeral_a_pattern, 'n')
endfunction

function! textobj#numeral#move_P()
    return s:move(g:textobj_numeral_a_pattern, 'p')
endfunction

function! textobj#numeral#move_digit_n()
    return s:move(g:textobj_numeral_digit_a_pattern, 'n')
endfunction

function! textobj#numeral#move_digit_p()
    return s:move(g:textobj_numeral_digit_i_pattern, 'p')
endfunction

function! textobj#numeral#move_digit_N()
    return s:move(g:textobj_numeral_digit_a_pattern, 'n')
endfunction

function! textobj#numeral#move_digit_P()
    return s:move(g:textobj_numeral_digit_a_pattern, 'p')
endfunction

function! textobj#numeral#move_float_n()
    return s:move(g:textobj_numeral_float_i_pattern, 'n')
endfunction

function! textobj#numeral#move_float_p()
    return s:move(g:textobj_numeral_float_i_pattern, 'p')
endfunction

function! textobj#numeral#move_float_N()
    return s:move(g:textobj_numeral_float_a_pattern, 'n')
endfunction

function! textobj#numeral#move_float_P()
    return s:move(g:textobj_numeral_float_a_pattern, 'p')
endfunction

function! textobj#numeral#move_hex_n()
    return s:move(g:textobj_numeral_hex_i_pattern, 'n')
endfunction

function! textobj#numeral#move_hex_p()
    return s:move(g:textobj_numeral_hex_i_pattern, 'p')
endfunction

function! textobj#numeral#move_hex_N()
    return s:move(g:textobj_numeral_hex_a_pattern, 'n')
endfunction

function! textobj#numeral#move_hex_P()
    return s:move(g:textobj_numeral_hex_a_pattern, 'p')
endfunction

" vim: ft=vim fenc=utf-8 ff=unix foldmethod=marker:
