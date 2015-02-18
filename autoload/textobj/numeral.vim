" ============================================================================
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
" ============================================================================

function! s:select(pattern)
    let ln = getline('.')
    let lnum = line('.')

    if matchstr(ln, '.', col('.') - 1) !~ a:pattern
        call search(a:pattern, '', lnum)
        if matchstr(ln, '.', col('.') - 1) !~ a:pattern
            return
        endif
    endif

    call search(a:pattern, 'bc', lnum)
    let start_pos = getpos('.')
    call search(a:pattern, 'ce', lnum)
    let end_pos = getpos('.')
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

" vim: ft=vim fenc=utf-8 ff=unix foldmethod=marker:
