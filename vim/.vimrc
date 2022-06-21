syntax on
set encoding=UTF-8
set cc=80
call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'dpc/vim-smarttabs'

" NERDTree
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Deoplete - Python Source
Plug 'deoplete-plugins/deoplete-jedi'

" VIM-LSP Async Language Server
Plug 'prabirshrestha/vim-lsp'

let g:deoplete#enable_at_startup = 1

" Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" Hide Z Section if it's the default value
" let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" Devicons
" Plug 'ryanoasis/vim-devicons'

" Table Mode 
Plug 'dhruvasagar/vim-table-mode'

" Z80 Assembly
Plug 'samsaga2/vim-z80'

" PlantUML
Plug 'aklt/plantuml-syntax'
" Bug fix: Disable Autoindent for UML files
autocmd BufEnter *.puml exe ':set noautoindent'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'


" Plugin Dev
" 
"Plug '~/Github/voyager-v'
call plug#end()





" UI Settings
set guifont=SauceCodeProNerdFontCompleteM-Regular:h11
" set guifont=aahub_light
set linebreak
set showbreak=›››\     " there's a trailing <Space>, here.

" DEFAULT FORMATTING
set nu
set ts=4 sw=4 noet

" HLNext Implementation
" Damian Conway, "More Instantly Better Vim" - OSCON 2013
" https://www.youtube.com/watch?v=aHm36-na4-4&ab_channel=O%27Reilly
set hlsearch
nnoremap <silent> n  n:call HLNext(0.1)<cr>
nnoremap <silent> N  N:call HLNext(0.1)<cr>
function! HLNext (blinktime)
	set invcursorline
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	set invcursorline
	redraw
	
"	highlight BlackOnBlack guifg=#000000 guibg=#000000 ctermfg=black ctermbg=black
"	let [bufnum, lnum, col, off] = getpos('.')
"	let matchlen = strlen(matchstr(strpart(getline('.'), col-1),@/))
"	let hidepat = '\%<'.lnum.'l.'
"		\ . '\I'
"		\ . '\%'.lnum.'l\%<'.col.'v.'
"		\ . '\I'
"		\ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
"		\ . '\I'
"		\ . '\%>'.lnum.'l.'
"	let hide = matchadd('BlackOnBlack', hidepat, 101)
"	redraw
"	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"	call matchdelete(hide)
"	redraw

"	highlight WhiteOnRed ctermfg=white ctermbg=red
"	let [bufnum, lnum, col, off] = getpos('.')
"	let matchlen = strlen(matchstr(strpart(getline('.'), col-1), @/))
"	let target_pat = '\c\%#'.@/
"	let blinks = 3
"	for n in range(1, blinks)
"		let red = matchadd('WhiteOnRed', target_pat, 101)
"		redraw
"		exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
"		call matchdelete(red)
"		redraw
"		exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
"	endfor
endfunction

" showing white-space characters
" exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" set list

""" F5 AUTO COMMANDS

" MarkDown file previewing
" Install any markdown renderer on Chrome before using this
autocmd BufEnter *.md exe 'noremap <F5> :!open -a "Google Chrome.app" %:p<CR>'

" PUML File (PlantUML) Previewing
" To generate the image file, use :PlantumlSave [filepath] [format] manually
autocmd BufEnter *.puml exe 'noremap <F5> :PlantumlOpen<CR>'

" Spacebar is binded to folding in normal mode
" 
nnoremap <space> za


" Append modline after the last line in the buffer.
" Use \ml to execute the command
function! AppendModeline()
	let l:modeline = printf(" vim: set ts=%d sw=%d %set ", &tabstop, &shiftwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

set background=dark
colorscheme evening
set guifont="Droid Sans Mono Dotted for Powerline 10"    
" vim: set ts=4 sw=4 noet 

let g:LanguageClient_serverCommands = {
    \ 'systemverilog': ['svls'],
    \ }

