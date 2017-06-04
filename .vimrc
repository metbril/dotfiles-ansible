" PLUGIN MANAGEMENT {{{ 1
" pathogen plugin {{{ 2
execute pathogen#infect()
syntax enable
filetype plugin indent on

command! -nargs=0 Update :!for folder in ~/.vim/bundle/*; do echo "${folder}"; git -C "${folder}" pull; done
" }}} 2
" }}} 1
" COLORS AND UI {{{ 1
set background=dark
colorscheme lucius
call togglebg#map("<F5>")
set guifont=Source\ Code\ Pro:h14
" }}} 1

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set encoding=utf-8 
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile " undo previous actions even after you close and reopen a file

" FILE HANDLING {{{ 1
" automatically read files modified outside vim
:set autoread

" reload when entering the buffer or gaining focus
au FocusGained,BufEnter * :silent! !

" save when exiting the buffer or losing focus
au FocusLost,WinLeave * :silent! w
" :W and :Save will escape a file name and write it
command! -bang -nargs=* W :call W(<q-bang>, <q-args>) 
command! -bang -nargs=* Save :call Save(<q-bang>, <q-args>) 

function! W(bang, filename) 
    :exe "w".a:bang." ". fnameescape(a:filename) 
endfu 

function! Save(bang, filename) 
    :exe "save".a:bang." ". fnameescape(a:filename) 
endfu 

" }}} 1
" STATUSLINE {{{ 1
set showcmd
" }}} 1
" MAPPING {{{ 1
" insert timestamp 
" http://vim.wikia.com/wiki/VimTip97#Automatically_update_timestamps
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>
" }}} 1
" ABBREVIATIONS {{{ 1
:iabbrev <expr> dts strftime('%F %T')
:iabbrev <expr> dtss strftime('%Y%m%d%H%M%S')
" }}} 1
" NOTETAKING {{{ 1
command -nargs=1 Note :exe "e! " . fnameescape("/Dropbox/text/notes/.txt") 
command -nargs=1 Nls :Ack --text "" $NOTES_DIR 
command Ncd :cd $NOTES_DIR
" }}} 1
" WINDOW SPLITTING {{{ 1
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally

" more natural
set splitbelow
set splitright

" easy window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Steve Losh
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> " quick open .vimrc

nnoremap 'v :e! $MYVIMRC<cr><cr>
" vim: set fdm=marker fmr={{{,}}} fdl=0 :

