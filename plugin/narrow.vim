" narrow - Emulate Emacs' narrowing feature
" Version: 0.1
" Copyright (C) 2007 kana <http://nicht.s8.xrea.com/>
" License: MIT license (see <http://www.opensource.org/licenses/mit-license>)
" $Id$

if exists('g:loaded_narrow')
  finish
endif




command -bar -range Narrow  call narrow#Narrow(<line1>, <line2>)
command -bar Widen  call narrow#Widen()




let g:loaded_narrow = 1

" __END__
" vim: foldmethod=marker
