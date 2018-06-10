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


" Initialize plugin system
call plug#end()

syntax enable
set background=dark
colorscheme solarized
set number
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1


" .h Header guard
function! s:insert_gates()
	    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	        execute "normal! i#ifndef " . gatename
		    execute "normal! o#define " . gatename . "\n\n\n"
		        execute "normal! Go#endif /* " . gatename . " */"
			    normal! kk
		    endfunction
		    autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

