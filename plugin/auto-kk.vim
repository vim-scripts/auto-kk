"---------------------------------------------------------------------------
"    Description:  Programming automation
"    Author:       kk , ywgx , vimperator@163.com
"    Division:     Software College Northeastern University
"    Version:      1.6
"---------------------------------------------------------------------------

map <c-f> :/<s-insert><cr>n
imap <c-z> <esc>ua
nmap <c-z> <esc>u

map j gj
map k gk
nnoremap <M-J> /\v^(\w+\s+)?\w+::.+\(.*\)<cr>
nnoremap <M-K> ?\v^(\w+\s+)?\w+::\w+\(.*\)<cr>
no! <M-k> <Up>
no! <M-h> <left>
no! <M-l> <Right>
map <C-j> <C-W>j
map <C-k> <C-W>k

nm <silent> `r :!ctags -R --exclude=tmp --languages=-javascript,-sql<CR>
nm <silent> `c :!ctags -R --exclude=tmp --languages=-javascript,-sql<CR>
nm <silent> `t :!ctags -R --exclude=tmp --languages=-javascript,-sql<CR>

au FileType python,ruby :call Py()
au FileType cpp,c,cc,h :call Cc()

func Py()
   nm \rr :call CR1()<CR>
   im \rr <ESC>:call CR1()<CR>
   im <F2> <ESC>:call Release1()<cr>
   if exists("$DISPLAY")
      nm <F2> <ESC>:call Release1()<cr>
   else
      nm <F2> <ESC>:call Release1()<cr>
   endif
endf

func Cc()
   im<silent> \rr <ESC>A;<ESC>
   im<silent> nn <ESC>A;<ESC>o
   if exists("$DISPLAY")
      nm<F2> :call CR()<CR><CR>
      im<F2> <ESC> :call CR()<CR><CR>
      nm <c-e> :call CR()<CR><CR>
   else
      nm<F2> :call CR1()<CR>
      im<F2> <ESC> :call CR1()<CR>
      nm <c-e> :call CR1()<CR>
   endif
   nm<silent> ca I/*<ESC><left>A<ESC><left>
   nm<silent> cd :s/\/\*//g<cr><ESC>:s/\*\///g<cr><ESC>
endf
func Release1()
   exe "w"
   if &filetype == 'ruby'
      exe "!mkex_.rb % make"
   endif
endf
func CR()
   exe "w"
   if &filetype == 'python'
      exe "!clear;python %"
   elsei &filetype == 'ruby'
      "exe "!clear;jruby %"
      exe "!clear;ruby -w %"
   elsei &filetype == 'sh'
      exe "!clear;bash %"
   elsei &filetype == 'pl'
      exe "!clear;perl %"
   endif
endf
func CR1()
   exe "w"
   if &filetype == 'python'
      exe "!python %"
   elsei &filetype == 'ruby'
      "exe "!jruby %"
      echo 'g:auto_kk_rbversion'
      exe "!D:/Ruby193/bin/ruby -w %"
   elsei &filetype == 'sh'
      exe "!bash %"
   elsei &filetype == 'pl'
      exe "!perl %"
   endif
endf
