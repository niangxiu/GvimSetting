source $VIMRUNTIME/mswin.vim
set nocompatible
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on
"set ai "Auto indent

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32") || has("win64")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Add a bit extra margin to the left
"set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

try
    colorscheme desert
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" set indent when opening certain files
" 1 tab == 2 spaces
autocmd BufNewFile,BufRead *.cpp,*.hpp,*.tex,*.m,tex.snip,m.snip,plaintex.snip set shiftwidth=2 softtabstop=2 tabstop=2
" 1 tab == 4 spaces
autocmd BufNewFile,BufRead *.py,python.snip,*.html set shiftwidth=4 softtabstop=4 tabstop=4

" Linebreak on 500 characters
set wrap "Wrap lines
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set showbreak=>\ \ \


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => behave like windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" backspace in Visual mode deletes selection
vnoremap <BS> d

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => my misc setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display line numbers on the left
set number

" maximize window size and set guifonts
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window (for an alternative on Windows, see simalt below).
    set lines=40 columns=85
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=consolas:h13
endif

" set short message
" set shortmess=a
" silent !echo Hello

" set folding
augroup vimrc
  au BufReadPre * setlocal foldmethod=manual "indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
if &diff                             " only for diff mode/vimdiff
  set diffopt=filler,context:1000000 " filler is default and inserts empty lines for sync
endif

" motion key in insert mode
inoremap <C-a> <Esc>g$a
nnoremap <C-a> g$a
xnoremap <C-a> <Esc>g$a
vnoremap <C-a> <Esc>g$a

" set uniform clipboard
if has("unix")
    set clipboard=unnamedplus
elseif has("win32")
    set clipboard=unnamed
endif

" yank stack shortcut
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
let g:yankstack_map_keys = 0

" set full screen toggle for windows
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0) <CR>

" set autopairs of <> when opening a .html file
autocmd BufNewFile,BufRead *.html let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<':'>'}

" no .un~ files
:set noundofile

" enable mouse to drag window
:set mouse=n
:set ttymouse=xterm2

" set full screen toggle for windows
map <F3> <Esc>:NERDTree<CR>B
let NERDTreeIgnore = ['\.pyc$', '\.png$', '\.p$', '\.dll$', '\.aux$', '\.log$', '\.fls$', '\.spl$', '\.fdb_latexmk$', '\.synctex$', '\.synctex.gz$', '\.out$', '\.pdf$', '\.ini$', '\.zip', '\.bst' ]
let NERDTreeQuitOnOpen=1

" spell check on .txt files
autocmd BufNewFile,BufRead *.tex,*.txt set spell spelllang=en_us 

" If doing a diff. Upon writing changes to file, automatically update the differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Allow us to use Ctrl-s and Ctrl-q as keybinds
" Restore default behaviour when leaving Vim.
if has ("unix")
    silent !stty -ixon
    autocmd VimLeave * silent !stty ixon
endif

" Run checktime when gain focus or enter buffer, but avoiding the "Command Line" (q:) window
au FocusGained,BufEnter * checktime
" save when exiting the buffer or losing focus
"au FocusLost,WinLeave * : w

" set wrap in vimdiff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR><Esc>
vnoremap <C-S>		<Esc>:update<CR><Esc>
inoremap <C-S>		<Esc>:update<CR><Esc>

" configurations for latex:
" set autopairs of $$ when opening a .tex file
autocmd BufNewFile,BufRead *.tex let g:AutoPairs = {'(':')', '[':']', '{':'}',"``":"''", "`":"'", '$':'$'}
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
autocmd BufNewFile,BufRead *.tex set iskeyword+=:

" configuration for vimtex
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_quickfix_ignore_filters = [
      \ 'Marginpar on page',
      \ 'Overfull', 'Underfull',
      \]
let g:vimtex_quickfix_mode = 1
let g:vimtex_quickfix_autoclose_after_keystrokes = 2
"let g:vimtex_view_enabled = 0
let g:vimtex_view_automatic = 1
let g:vimtex_indent_on_ampersands = 0
let g:vimtex_toc_config = {
      \ 'hide_line_numbers' : 1, 
      \ 'layer_status' : { 'content': 1, 'label': 0, 'todo': 1, 'include': 1},
      \ }


" help doc for the windows systems and linux
if has("win16") || has("win32") || has("win64")
    :helptags C:\Programs\Vim\vimfiles\bundle\vimtex\doc\
    :helptags C:\Programs\Vim\vimfiles\bundle\vimcompletesme\doc\
    :helptags C:\Programs\Vim\vimfiles\bundle\nerdcommenter\doc\
    :helptags C:\Programs\Vim\vimfiles\bundle\nerdtree\doc\
    :helptags C:\Programs\Vim\vimfiles\bundle\vim-yankstack\doc\
    :helptags C:\Programs\Vim\vimfiles\bundle\neosnippet\doc
else
    :helptags /usr/share/vim/vimfiles/bundle/vimtex/doc
    :helptags /usr/share/vim/vimfiles/bundle/vimcompletesme/doc
    :helptags /usr/share/vim/vimfiles/bundle/nerdcommenter/doc
    :helptags /usr/share/vim/vimfiles/bundle/nerdtree/doc
    :helptags /usr/share/vim/vimfiles/bundle/vim-yankstack/doc
    :helptags /usr/share/vim/vimfiles/bundle/neosnippet/doc
endif


" for vimcompletsme
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
augroup VimCompletesMeTex
    autocmd!
    autocmd FileType tex
        \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
        "\ setlocal complete-=id
augroup END

set complete-=i


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = "$VIM/vimfiles/bundle/mysnippets"
let g:neosnippet#enable_auto_clear_markers = 0


"switch to the next or previous buffer in the buffer list, A list of your buffers can be shown after switching
nnoremap <C-n> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <C-p> :bprevious<CR>:redraw<CR>:ls<CR>


" for ctags and taglist
let Tlist_Ctags_Cmd = 'C:\Programs\Vim\vimfiles\bundle\ctags58\ctags.exe'
nnoremap <silent> <F4> :TlistOpen<CR>
let Tlist_Close_On_Select = 1


" auto save on
"let g:auto_save = 1  " enable AutoSave on Vim startup, but this conflict with neosnippet
"let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
""let g:auto_save_silent = 1  " do not display the auto-save notification
""let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHold", "CursorHoldI", "CompleteDone"]
"let g:auto_save_events = ["InsertLeave", "TextChanged"]

let g:auto_save = 0  " disable AutoSave on Vim startup, but this conflict with neosnippet
"autocmd TextChanged,TextChangedI <buffer> silent write
autocmd TextChanged,TextChangedI * silent write


" Edit vimr configuration file
nnoremap <Leader>ve :e $VIM/vimrc<CR>
" Reload vimr configuration file
nnoremap <Leader>vv :source $VIM/vimrc<CR>

imap <C-L> <Esc>
xmap <C-L> <Esc>
nmap <C-L> <Esc>
omap <C-L> <Esc>

autocmd FileType tex imap kk $
imap kj <Del>
autocmd FileType tex imap kl ~

nmap e 4w
vmap e 4w
nmap q 4b
vmap q 4b
autocmd FileType tex set indentkeys=

noremap % v%

vnoremap y ygv<Esc>
xnoremap y ygv<Esc>
nnoremap p gp

nnoremap j gj
nnoremap k gk

":nnoremap <Down> gj
":nnoremap <Up> gk
":inoremap <Down> <Esc>gj
":inoremap <Up> <Esc>gk
"noremap <silent> 0 g0
"noremap <silent> $ g$
