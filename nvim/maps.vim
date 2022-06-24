" Description: Keymaps

func! CompileLua()
  ! lua %
endfunc

nnoremap <leader>l :call CompileLua()<CR>

nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Escape seqence
inoremap jk <ESC>

" Increment/decrement
nnoremap + <C-a> 
nnoremap - <C-x>

" Delete a word backwards
" nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"------------------------------
" MarkDown Preview

" normal/insert
nmap <C-s> <Plug>MarkdownPreview
nmap <S-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

"------------------------------
" Buffers

" Move to previous/next
nnoremap <silent>    <A-.> :bnext<CR>
nnoremap <silent>    <A-,> :bprevious<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> :bfirst<CR>
nnoremap <silent>    <A-2> :buffer 2<CR>
nnoremap <silent>    <A-3> :buffer 3<CR>
nnoremap <silent>    <A-4> :buffer 4<CR>
nnoremap <silent>    <A-5> :buffer 5<CR>
nnoremap <silent>    <A-6> :buffer 6<CR>
nnoremap <silent>    <A-7> :buffer 7<CR>
nnoremap <silent>    <A-8> :buffer 8<CR>
nnoremap <silent>    <A-9> :blast<CR>

" Close buffer
nnoremap <silent>    <A-c> :bdelete<CR>
