set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


"
" PLUGINS.
"
" Add the pluging plug
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
Plug 'easymotion/vim-easymotion' " move in the files
Plug 'scrooloose/nerdtree' "file explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " show git files in nerdtree
Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes' " status bar themes
Plug 'tpope/vim-fugitive'  "Manage git
Plug 'dyng/ctrlsf.vim' "search in files
Plug 'Valloric/YouCompleteMe' " autocomplete
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround' " 
Plug 'w0rp/ale' " linter
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'			" Panel with the tags in file.
Plug 'ryanoasis/vim-devicons'			" Fanzy icons in vim.
Plug 'mhinz/vim-startify'			" Customize the start screen in vim.
Plug 'editorconfig/editorconfig-vim'		" Editorconfig plugin.
Plug 'pangloss/vim-javascript'			" Javascript highlight. Including es7.
Plug 'mxw/vim-jsx'				" JSX Highlight 
Plug 'mbbill/undotree'				" Panel to handle the *undo* changes
Plug 'Raimondi/delimitMate' 			" Auto close brackets
Plug 'airblade/vim-rooter'			" Set the workspace root automatically
" Find files, tags, comands, etc.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'				" Allow use fzf with vim
Plug 'craigemery/vim-autotag'			" generate the tags in a project automatically
Plug 'vim-vdebug/vdebug'			" Debug multilang
Plug 'arithran/vim-delete-hidden-buffers'	" Delete the hidden buffers.
Plug 'junegunn/gv.vim'				" Git history plugin
Plug 'matze/vim-move'				" alt key to move the lines.
Plug 'jmcantrell/vim-virtualenv'      		" Virtual env 
Plug 'kshenoy/vim-signature'                    " Show the makrs in the lateral bar


" THEMES
Plug 'aradunovic/perun.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

"
" VIM REMAP.....
"
" Define the leader
let mapleader = " "
" escape
imap jj <Esc>
nnoremap tt :tabclose<CR>:tabp<CR>


nnoremap x "_x

" Move between tabs and splits
" Splits
noremap <C-a> <C-w>h
noremap <C-s> <C-w>j
noremap <C-w> <C-w>k        
noremap <C-d> <C-w>l        

" Next  tab
noremap <C-e> gt	
" Previous tab
noremap <C-q> gT        

" command to open vim config in new tab.
command! Vimconfig :tabe /home/davidcasado/.config/nvim/init.vim

" buffer
nmap gbt :ls<CR>:tab sb<Space>
nmap gbb :ls<CR>:b<Space>
nmap gbd :ls<CR>:bd<Space>
nmap gbx :ls<CR>:sb<Space>
nmap gbv :ls<CR>:vertical :sb<Space>
nmap gba :ba<CR>
nmap gbf :Buffers<CR>
nmap gbp :bprevious<CR>
nmap gbn :bnext<CR>
" Delete all buffers hidden.
nnoremap gbD :DeleteHiddenBuffers<CR>

" remap TAB key
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Save the data correctly, this allow refresh the bwatchall and bompass.
set backupcopy=yes

set nowrap " The lines won't break in newline when they are longer than screen.

"
"
" PATHS
" Copy in the system clipboard the *bwatch directory* of the current file, if it
" exists.
function! GetBwatchDirectory()
	let r = expand("%:p:h")
	while r != "/" && !(isdirectory(r . "/jsx") && isdirectory(r . "/js"))
		let r = fnamemodify(r, ":h")
	endwhile

	return r

endfunction

function! CopyBwatchDirectory()
	let r = GetBwatchDirectory()

	if r != "/"
		" bwatch directory found. copy it in the system clipboard.
		let @+ = r
		echo "Copied!"
	else
		" bwatch directory not found. Show and error.
		echoerr "bwatch directory not found"
	endif
endfunction

nnoremap <leader>pp :let @+ = @%<CR>		    " copy in system clipboard the project path of current files.
nnoremap <leader>pP :let @+ = expand("%:p")<CR>     " copy in system clipboard the FULL path of current file.
nnoremap <leader>pf :let @+ = expand("%:t")<CR>     " copy in the system clipboard the current filename"
nnoremap <leader>pd :let @+ = expand("%:h")<CR>     " copy in the system clipboard the FULL directory of the current file.
nnoremap <leader>pD :let @+ = expand("%:p:h")<CR>   " copy in the system clipboard the project directory of the current file.
nnoremap <leader>pj :call CopyBwatchDirectory()<CR> " copy the *bwatch directory* of the current file, if it exists.



"
"marks
nnoremap gp `
nnoremap gl '

" macros
nmap <Leader>q @

" Nerdtree
map <leader>e :NERDTreeToggle<CR>
map <leader>ce :NERDTreeClose<CR>

" Search highlight
set hlsearch
nnoremap <leader><leader>h :set hlsearch!<CR>
nnoremap // :History/<CR>
vnoremap // "9y<CR>/<C-R>9<CR>

" commentary
nmap gk gcc
vmap gk gc

" GIT
" fugitive
nmap <Leader>hd :tabe %<CR>:Gdiffsplit<CR>

"gitgutter
nmap <Leader>hk <Plug>(GitGutterPrevHunk)
nmap <Leader>hj <Plug>(GitGutterNextHunk)

" close a window preview
nmap <leader>hq :pclose<CR>

" Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent> gt :TagbarToggle<CR>
let g:tagbar_autofocus=1

"
" OTHERS............
"
:set number " set the number lines
:set numberwidth=4
:set mouse=a " enable mouse. Need more info.
:set colorcolumn=100,120 " set the column line
" :set cursorcolumn
" :set cursorline

" set theme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='medium'
colorscheme nord " Theme name
set termguicolors
hi Normal guibg=NONE ctermbg=NONE " Remove vim background


"
" remove vim background
" hi Normal guibg=NONE ctermbg=NONE


" ale
nmap gaj :ALENext<CR>
nmap gak :ALEPrevious<CR>
let g:ale_fixer = {'javascript': ['eslint']}
let g:ale_javascript_eslint_use_global = 0
nmap ga, gaka;jj
nmap ga; gaja;jj
"ale php
let g:ale_php_phpmd_ruleset = '/home/davidcasado/workspace/framework/phpmd.xml'
let g:ale_php_phpcs_standard = "PSR2"

nnoremap <leader>cs :!php-cs-fixer fix --config=/home/davidcasado/workspace/framework.phpcs %:p<CR>



" disable <C-j> in NERDTree
let g:NERDTreeMapJumpNextSibling="☻""
let g:NERDTreeMapJumpPrevSibling="☺""
let g:NERDTreeMapOpenSplit="x"
let g:NERDTreeMapPreviewSplit="sx"
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapPreviewVSplit="sv"

" updatetime in gitgutter
set updatetime=100

" enwable powerline fonts.
" It is necesary download powerlinefonts and powerline-statusbarline
" to run correctly
let g:airline_powerline_fonts = 1


set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

" show buffer with vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = ""
let g:airline_section_z = ""
let g:airline_section_x = ""
let g:airline_section_y = ""

let g:airline_section_warning = ""

"strip spaces
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1


"ctrlf vim
nmap     <leader>ff <Plug>CtrlSFPrompt
vmap     <leader>ff <Plug>CtrlSFVwordPath
vmap     <leader>fF <Plug>CtrlSFVwordExec
nmap     <leader>fn <Plug>CtrlSFCwordPath
nmap     <leader>fp <Plug>CtrlSFPwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>

" ctrlsf vim
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_case_sensitive = 'yes'
let g:ctrlsf_auto_focus = {
	\ "at": "start"
	\ }

let g:ctrlsf_mapping = {
	\ "split": "o",
	\ "vsplit": "i",
	\}

" emmet
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Undo tree
nnoremap <leader>u :UndotreeToggle<cr>

" complete me
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
nnoremap <leader>yp :YcmCompleter GetDoc<CR>
nnoremap <leader>yg :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ym :YcmCompleter RefactorRename 
nmap <leader>yq :pclose<CR>

" vnoremap <A-k> dkP
" vnoremap <A-j> dp
" " others
" nnoremap <A-k> ddkP
" nnoremap <A-j> ddp
let g:move_key_modifier = 'A'


" fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-t> :W<CR>


" arithran/vim-delete-hidden-buffer


" debug
if !exists('g:vdebug_options')
	let g:vdebug_options = {}
endif


let g:vdebug_options.break_on_open = 0
let g:vdebug_options.port = 9010
let g:vdebug_options.ide_key = 'vagrant'


" vim javascript
let g:javascript_plugin_jsdoc = 1


" vim rooter
let g:rooter_patterns = ['Rakefile', '.git/']

" vim fugitive
nnoremap <leader>fd :Gdiff<CR>	" Open the diff buffer of the current file.


let g:rubycomplete_buffer_loading=1

let g:fzf_action = {
 \ 'enter':  'e',
 \ 'ctrl-t': 'tab split',
 \ 'ctrl-o': 'split',
 \ 'ctrl-i': 'vsplit',}

" python pynvim virtualenv
let g:python_host_prog = '/home/davidcasado/nvim/nvimpy2/bin/python'
let g:python3_host_prog = '/home/davidcasado/nvim/nvimpy3/bin/python'

"virtual env
let g:virtualenv_directory = '/home/davidcasado/workspace'

:set signcolumn="yes:9"
let g:gitgutter_sign_column_always = 1
