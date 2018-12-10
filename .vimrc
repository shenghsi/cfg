
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'captbaritone/molokai'
Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Initialize plugin system
call plug#end()

"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"let NERDTreeAutoDeleteBuffer = 1
""let NERDTreeQuitOnOpen = 1
""Automatically quit vim if NERDTree is last and only buffer
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" vundle begin
"set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
""Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"" Plugin 'ascenator/L9', {'name': 'newL9'}
""Plugin 'nathanaelkane/vim-indent-guides'
""Plugin 'taglist.vim'
""Plugin 'TxtBrowser'
""Bundle 'gabrielelana/vim-markdown'
""Plugin 'Txtfmt-The-Vim-Highlighter'
"" All of your Plugins must be added before the following line
"call vundle#end()            " required

"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" vundle ends

" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
set background=dark

colorscheme molokai
" use Monokai terminal theme
"colorscheme monokai
" hemisu works with peppermint terminal theme
"colorscheme hemisu
"colorscheme atom
"colorscheme github
"colorscheme solarized
"colorscheme termschool
"colorscheme jellybeans
"colorscheme vividchalk
"colorscheme candy
"colorscheme distinguished

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"make vim save and load the folding of the document each time it loads"
""also places the cursor in the last place that it was left."
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview
"autocmd BufWritePost,BufLeave,WinLeave ?* if empty(glob(expand('%:p'))) | mkview | endif
"autocmd BufWinEnter ?* if empty(glob(expand('%:p'))) | silent loadview | endif
"let g:skipview_files = [
"            \ '[EXAMPLE PLUGIN BUFFER]',
"            \ '[Vundle] Installer'
"            \ ]
"function! MakeViewCheck()
"    if has('quickfix') && &buftype =~ 'nofile'
"        " Buffer is marked as not a file
"        return 0
"    endif
"    if empty(glob(expand('%:p')))
"        " File does not exist on disk
"        return 0
"    endif
"    if len($TEMP) && expand('%:p:h') == $TEMP
"        " We're in a temp dir
"        return 0
"    endif
"    if len($TMP) && expand('%:p:h') == $TMP
"        " Also in temp dir
"        return 0
"    endif
"    if index(g:skipview_files, expand('%')) >= 0
"        " File is in skip list
"        return 0
"    endif
"    return 1
"endfunction
"augroup vimrcAutoView
"    autocmd!
"    " Autosave & Load Views.
"    autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
"    autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
"augroup end
"
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" highlight the current line in every window and update the highlight as the cursor moves.
:set cursorline
"hi CursorLine term=bold cterm=bold guibg=234 ctermbg=236

" highlight applied only in the current window, use an autocmd
"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
" set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
" set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

set guifont=Menlo:h14
"set guifont=Monaco:h12

" make the setting effective immediately after saving .vimrc
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

"set fillchars=vert:\ 

"------------------------------------------------------------
" set filetype 
"autocmd BufNewFile,BufRead *.md set filetype=markdown
"au BufNewFile,BufRead *.md  setf markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

"------------------------------------------------------------
"nathanaelkane/vim-indent-guides
"colorscheme default

let indent_guides_auto_colors = 0

let g:indent_guides_enable_on_vim_startup=1

let g:indent_guides_start_level=2

let g:indent_guides_guide_size=1

hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven ctermbg=240

" Enable syntax highlighting
syntax on
hi Normal ctermbg=none
au BufEnter *.txt setlocal ft=txt

" customize netrw like nerdtree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END


"------------------------------------------------------------
" Mappings 
" :map and :noremap are recursive and non-recursive 
" a mapping that works in normal, visual, select and operator modes (:map and :noremap)
" one that works in normal mode (:nmap and :nnoremap)
" one in visual mode (:vmap and :vnoremap) 
" Useful mappings
let mapleader=";"
let maplocalleader="'"
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR>
"nmap <Leader>nh :noh<CR>

" copy selection to system clipboard in visual mode and paste from system clipboard
" On macOS:
vnoremap <Leader>c :w !pbcopy<CR><CR>
noremap <Leader>v :r !pbpaste<CR><CR>
"On most Linux Distros, substitute:
"pbcopy with xclip -i -sel c or xsel -i -b
"pbpaste using xclip -o -sel -c or xsel -o -b

" keep only the current window
nmap <Leader>o :only<CR>
" close current window
nmap <Leader>q :q<CR>
" close all windows
nmap <Leader>1 :qa<CR>
" quit without save
nmap <Leader>Q :qa!<CR>
" save
nmap <Leader>w :w<CR>
" cursor moving maps
nmap <Leader>h <C-w><C-w>
" switch buffer
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>b :bp<CR>
" delete current buffer without closing window
nnoremap <Leader>d :bp\|bd #<CR>

" Nerdtree maps
"nnoremap <silent> <Leader>t :NERDTreeFind<CR>
"nnoremap <Leader>f :NERDTreeToggle<Enter>
"netrw maps
nnoremap <Leader>f :Vexplore<Enter>
" IndentGuides maps
nnoremap <silent> <Leader>i <Plug>IndentGuidesToggle

" insert mode map, auto adding curly brace pair
inoremap {<CR> {<CR>  <CR>}<up><right>

