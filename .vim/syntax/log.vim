" Vim syntax file
" Language:         Generic log files
" Maintainer:       Alex Dzyoba <avd@reduct.ru>
" Latest Revision:  2013-03-08
" Changes:          2013-03-08 Initial version

" Based on messages.vim - syntax file for highlighting kernel messages

if exists("b:current_syntax")
  finish
endif

"syn match log_critical  '\c\(CRITICAL\).*'
syn match log_error 	'\c\(CRITICAL\|FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\).*'
syn match log_warn 	'\c\(WARNING\|DELETE\|DELETING\|DELETED\|RETRY\|RETRYING\).*'
syn region log_string 	start=/'/ end=/'/ end=/$/ skip=/\\./
syn region log_string 	start=/"/ end=/"/ skip=/\\./
syn match log_number 	'0x[0-9a-fA-F]*'
syn match log_number 	'\d\+'

syn match   log_date '\c\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *'
syn match   log_date '\d\{4}-\d\d-\d\d'
syn match   log_time '\d\d:\d\d:\d\d\([,|\.]\d\d\d\)\?'


"hi def link log_critical Critical
hi def link log_string  String
hi def link log_error   ErrorMsg
hi def link log_warn 	WarningMsg
hi def link log_number  Constant	
hi def link log_date 	Normal
hi def link log_time    Normal 

let b:current_syntax = "log"
