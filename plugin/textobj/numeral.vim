" ============================================================================
" textobj-numeral - Text objects for numbers
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


if !exists('g:textobj_numeral_strict_mode')
    let g:textobj_numeral_strict_mode = 0
endif
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
\       'select-i': 'in',
\       'select-a-function': 'textobj#numeral#select_a',
\       'select-i-function': 'textobj#numeral#select_i',
\       'move-n': 'gnn',
\       'move-p': 'gpn',
\       'move-N': 'gNn',
\       'move-P': 'gPn',
\       'move-n-function': 'textobj#numeral#move_n',
\       'move-p-function': 'textobj#numeral#move_p',
\       'move-N-function': 'textobj#numeral#move_N',
\       'move-P-function': 'textobj#numeral#move_P',
\   },
\   'digit': {
\       'select-a': 'ad',
\       'select-i': 'id',
\       'select-a-function': 'textobj#numeral#select_digit_a',
\       'select-i-function': 'textobj#numeral#select_digit_i',
\       'move-n': 'gnd',
\       'move-p': 'gpd',
\       'move-N': 'gNd',
\       'move-P': 'gPd',
\       'move-n-function': 'textobj#numeral#move_digit_n',
\       'move-p-function': 'textobj#numeral#move_digit_p',
\       'move-N-function': 'textobj#numeral#move_digit_N',
\       'move-P-function': 'textobj#numeral#move_digit_P',
\   },
\   'float': {
\       'select-a': 'af',
\       'select-i': 'if',
\       'select-a-function': 'textobj#numeral#select_float_a',
\       'select-i-function': 'textobj#numeral#select_float_i',
\       'move-n': 'gnf',
\       'move-p': 'gpf',
\       'move-N': 'gNf',
\       'move-P': 'gPf',
\       'move-n-function': 'textobj#numeral#move_float_n',
\       'move-p-function': 'textobj#numeral#move_float_p',
\       'move-N-function': 'textobj#numeral#move_float_N',
\       'move-P-function': 'textobj#numeral#move_float_P',
\   },
\   'hex': {
\       'select-a': 'ax',
\       'select-i': 'ix',
\       'select-a-function': 'textobj#numeral#select_hex_a',
\       'select-i-function': 'textobj#numeral#select_hex_i',
\       'move-n': 'gnx',
\       'move-p': 'gpx',
\       'move-N': 'gNx',
\       'move-P': 'gPx',
\       'move-n-function': 'textobj#numeral#move_hex_n',
\       'move-p-function': 'textobj#numeral#move_hex_p',
\       'move-N-function': 'textobj#numeral#move_hex_N',
\       'move-P-function': 'textobj#numeral#move_hex_P',
\   },
\ })

let &cpo = s:save_cpo
let g:loaded_textobj_numeral = 1

unlet s:save_cpo

" vim: ft=vim fenc=utf-8 ff=unix foldmethod=marker:
