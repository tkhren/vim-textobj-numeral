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

if exists('g:loaded_textobj_numeral')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim


if !exists('g:textobj_numeral_a_pattern')
    let g:textobj_numeral_a_pattern = '[-+]\?\d\+\%(\.\d\+\)\?\%([eE][-+]\?\d\+\)\?'
endif
if !exists('g:textobj_numeral_i_pattern')
    let g:textobj_numeral_i_pattern = '\d\+'
endif
if !exists('g:textobj_numeral_digit_a_pattern')
    let g:textobj_numeral_digit_a_pattern = '[-+]\?\d\+'
endif
if !exists('g:textobj_numeral_digit_i_pattern')
    let g:textobj_numeral_digit_i_pattern = '\d\+'
endif
if !exists('g:textobj_numeral_float_a_pattern')
    let g:textobj_numeral_float_a_pattern = '[-+]\?\d\+\%(\.\d\+\)\?'
endif
if !exists('g:textobj_numeral_float_i_pattern')
    let g:textobj_numeral_float_i_pattern = '\d\+\%(\.\d\+\)\?'
endif
if !exists('g:textobj_numeral_hex_a_pattern')
    let g:textobj_numeral_hex_a_pattern = '\<\%(0x\|#\)\?\x\+\>'
endif
if !exists('g:textobj_numeral_hex_i_pattern')
    let g:textobj_numeral_hex_i_pattern = '\x\+\>'
endif

call textobj#user#plugin('numeral', {
\   '-': {
\       'select-a': 'an',
\       'select-a-function': 'textobj#numeral#select_a',
\       'select-i': 'in',
\       'select-i-function': 'textobj#numeral#select_i',
\   },
\   'digit': {
\       'select-a': 'ad',
\       'select-a-function': 'textobj#numeral#select_digit_a',
\       'select-i': 'id',
\       'select-i-function': 'textobj#numeral#select_digit_i',
\   },
\   'float': {
\       'select-a': 'af',
\       'select-a-function': 'textobj#numeral#select_float_a',
\       'select-i': 'if',
\       'select-i-function': 'textobj#numeral#select_float_i',
\   },
\   'hex': {
\       'select-a': 'ax',
\       'select-a-function': 'textobj#numeral#select_hex_a',
\       'select-i': 'ix',
\       'select-i-function': 'textobj#numeral#select_hex_i',
\   },
\ })

let &cpo = s:save_cpo
let g:loaded_textobj_numeral = 1

unlet s:save_cpo

" vim: ft=vim fenc=utf-8 ff=unix foldmethod=marker:
