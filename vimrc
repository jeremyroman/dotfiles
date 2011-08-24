" I don't care about vi compatibility
set nocompatible

" Allow plugins to load
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Line numbering and syntax highlighting
set number
set ruler
syntax on

" Default encoding
set encoding=utf-8

" Whitespace
set nowrap
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set list listchars=tab:\ \ ,trail:·

" Search settings (highlight results, incremental search, ignore case)
set hlsearch incsearch ignorecase smartcase

" Wildcard handling for tab completion
" (show a list and complete the longest common substring)
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Show the status line in all windows
set laststatus=2

" not all windows need be the same size
set noequalalways

" NERDTree plugin
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T plugin
let g:CommandTMaxHeight=20

" file type magic
if has("autocmd")
  au FileType make set noexpandtab
  au FileType python set tabstop=4 textwidth=79
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
endif

" Maximum backspacing power
set backspace=indent,eol,start

" Yes, load filetype settings
filetype plugin indent on

" Look for modelines in the first 10 lines of a file
set modeline modelines=10

" Default colour scheme
color railscasts-custom

" Keep swp files here
set backupdir=~/.vim/backup directory=~/.vim/backup

" MacVIM magic
let macvim_hig_shift_movement = 1

" Include .vimrc.local
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
