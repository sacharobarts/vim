" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'git://github.com/altercation/vim-colors-solarized.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'https://github.com/scrooloose/nerdtree.git' 
Plug 'Yggdroot/indentLine'

" Initialize plugin system
call plug#end()

" Set colors stuff to work with ssh terminal
if has('unix')
    set t_Co=256
endif

syntax enable
"let g:solarized_termcolors=256
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
set number
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
"highlight ColorColumn ctermbg=160 guibg=#D80000
"highlight ColorColumn ctermbg=0 guibg=lightgrey

filetype plugin indent on


" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
"let g:indentLine_setColors = 1




" .h Header guard
function! s:insert_gates()
	    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	        execute "normal! i#ifndef " . gatename
		    execute "normal! o#define " . gatename . "\n\n\n"
		        execute "normal! Go#endif /* " . gatename . " */"
			    normal! kk
		    endfunction
		    autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

