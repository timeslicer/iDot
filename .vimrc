set nocompatible

call pathogen#infect()
syntax on
filetype plugin indent on

set hidden
set nowrap
set tabstop=4 
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4 
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
"set relativenumber
set undofile

set pastetoggle=<F2>

" AUTOMATIC BACKUPS =====================================================
"enable backup
set backup
"
"Create a backup folder, I like to have it in $HOME/vimbackup/date/
let day = strftime("%Y.%m.%d")
let backupdir = $HOME."/,vim/vimbackup/".day
silent! let xyz = mkdir(backupdir, "p")
"
"Set the backup folder
let cmd = "set backupdir=".backupdir
execute cmd
"
"Create an extention for backup file, useful when you are modifying the 
"same file multiple times in a day. I like to have an extention with
"time hour.min.sec
let time = strftime(".%H.%M.%S")
let cmd = "set backupext=". time
execute cmd
"
"test.cpp is going to be backed up as HOME/vimbackup/date/test.cpp.hour.min.sec
" ===================================================== 



if &t_Co >= 256 || has("gui_running")
	   colorscheme mustang
   endif

if &t_Co > 2 || has("gui_running")
      syntax on
    endif

cmap w!! w !sudo tee % >/dev/null

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif 

au FocusLost * :wa

