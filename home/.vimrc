set nocompatible
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
set smarttab
set shiftwidth=4
set number
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set scrolloff=2
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

colorscheme codeschool

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=m
     set t_Sf=m
endif

