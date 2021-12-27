" Syntax highlighting on
syntax enable 

set number " Show line number
set ruler " Show file stats
set encoding=utf-8 " utf8
set showcmd " Show current commands in right bar
set showmatch " matching parens
set pastetoggle=<F2> " to toggle paste mode
set mouse=a " enable mouse scrolling

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases 
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers

" Turn on the Wild menu
set wildmenu

" Text, tab and indent related
set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Status line
set laststatus=2 " Always show the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c " Format the status line

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
return ''
endfunction
