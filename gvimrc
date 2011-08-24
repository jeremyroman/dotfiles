" MacVim settings
if has("gui_macvim")
  " Fullscreen takes over full screen
  set fuoptions=maxhorz,maxvert

  " Rebind Cmd+T
  macmenu &File.New\ Tab key=<D-T> " map Cmd+Shift+T to New Tab
  map <D-t> :CommandT<CR>
  imap <D-t> <Esc>:CommandT<CR>

  " Indentation shortcuts if I think I'm in TextMate
  vmap <D-]> >gv
  vmap <D-[> <gv
  map <D-]> >>
  map <D-[> <<
  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Misc shortcuts
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
  map <D-F> :Ack<space>
  map <D-/> <plug>NERDCommenterToggle<CR>
endif

" No toolbar, please
set guioptions-=T

" Colour scheme
color railscasts-custom

" Read .gvimrc.local
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
