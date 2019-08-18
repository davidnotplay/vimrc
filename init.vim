set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Add the vimrc original.
source ~/.vimrc


" Italic
set t_ZH=^[[3m
set t_ZR=^[[23m

"
" PLUGINS.
"
" Add the pluging plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'easymotion/vim-easymotion'      " The vim PLUGIN.
Plug 'vim-airline/vim-airline'        " status bar
Plug 'vim-airline/vim-airline-themes' " status bar themes
Plug 'tpope/vim-fugitive'  	      " Manage git
Plug 'junegunn/gv.vim'		      " Git log
Plug 'dyng/ctrlsf.vim' 		      " Search in the text files of your project. 
Plug 'Valloric/YouCompleteMe'         " Multilang autocomplete.
Plug 'mattn/emmet-vim'		      " html snippets.
Plug 'tpope/vim-surround' 	      " Plugins to add, change and delete languages 'wrappers' easily.
Plug 'w0rp/ale' 		      " Configurable and multilang linter.
Plug 'airblade/vim-gitgutter'         " Show the Git changes in the left of the screen.
Plug 'tpope/vim-commentary'	      " Comment one or more lines easily.
Plug 'majutsushi/tagbar'	      " Show a panel with the tags in file.
Plug 'ternjs/tern_for_vim'	      " javascript analysis enginer. Necessary for the tagbar in js files.
Plug 'ryanoasis/vim-devicons'	      " Vim icons.
Plug 'mhinz/vim-startify'	      " Initial vim screen.
Plug 'editorconfig/editorconfig-vim'  " Editor config plugin.
Plug 'pangloss/vim-javascript'	      " Highlight javascript syntax with, new features.
Plug 'mxw/vim-jsx'	              " Highlight react syntax.
Plug 'mbbill/undotree'		      " Plugin to handle the undo action.
Plug 'Raimondi/delimitMate' 	      " auto close brackets
Plug '~/.fzf'			      " Directory where are the command fzf
Plug 'junegunn/fzf.vim'		      " Search project files, commits, and buffers easily.
Plug 'airblade/vim-rooter'            " Set the workpace root directory automatically.
Plug 'craigemery/vim-autotag'         " Refresh automatically the project tag using ctags.
Plug 'vim-vdebug/vdebug'			" Debug multilang

" THEMES
Plug 'aradunovic/perun.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'matze/vim-move'

" Initialize plugin system
call plug#end()

"
" Custom remap
" ============
"
let mapleader = " "	" Define the leader
imap jj <Esc>
nnoremap tt :tabclose<CR>:tabp<CR>
nnoremap x "_x

command! Vimconfig tabe /home/davidnotplay/.config/nvim/init.vim

" Move between windows
" Previous split 
map <C-j> <C-w>w
" Next splite
map <C-k> <C-w>W        
" Next  tab
noremap <C-l> gt	
" Previous tab
noremap <C-h> gT        

" buffer
nmap gbt :ls<CR>:tab sb<Space>
nmap gbb :ls<CR>:b<Space>
nmap gbd :ls<CR>:bd<Space>
nmap gbx :ls<CR>:sb<Space>
nmap gbv :ls<CR>:vertical :sb<Space>
nmap gba :ba<CR>
nmap gbf :Buffer<CR>
nmap gbp :bprevious<CR>
nmap gbn :bnext<CR>
" Save the file and delete the buffer

" remap TAB key
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" remap paths
nnoremap <leader>pp :let @+ = @%<CR>
nnoremap <leader>pP :let @+ = expand("%:p")<CR>
nnoremap <leader>pf :let @+ = expand("%:t")<CR>
nnoremap <leader>pd :let @+ = expand("%:h")<CR>
nnoremap <leader>pD :let @+ = expand("%:p:h")<CR>


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

" commentary
nmap gk gcc
vmap gk gc

"fugitive
nmap <Leader>hd :tabedit %<CR>:Gdiff<CR>

"gitgutter
nmap <Leader>hk <Plug>GitGutterPrevHunk
nmap <Leader>hj <Plug>GitGutterNextHunk
" close a window preview
nmap <leader>hq :pclose<CR>

" Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent> gt :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_width=55

"
" OTHERS............
"
:set number " set the number lines
:set numberwidth=4
:set mouse=a " enable mouse. Need more info.
:set colorcolumn=100,120

" set theme
set termguicolors

colorscheme gruvbox " Theme name
let g:gruvbox_contrast_dark='medium'
set background=dark

" theme configuration nord
let g:nord_italic=1
let g:nord_italic_comments = 1

" ale
let g:ale_fixer = {'javascript': ['eslint']}
let g:ale_javascript_eslint_use_global = 1
let g:javascript_plugin_jsdoc = 1

" ale remap
nmap gaj :ALENext<CR>
nmap gak :ALEPrevious<CR>


" disable <C-j> in NERDTree
let g:NERDTreeMapJumpNextSibling="☻"
let g:NERDTreeMapJumpPrevSibling="☺"
let g:NERDTreeMapOpenSplit="x"
let g:NERDTreeMapPreviewSplit="sx"
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapPreviewVSplit="sv"

" updatetime in gitgutter
set updatetime=100



set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

"
" Airline
" =======
"
" enable powerline fonts.
" It is necesary download powerlinefonts and powerline-statusbarline
" to run correctly
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1  " show buffer with vim-airline
let g:airline_section_b = ""		      " hidden the b section in b airline
let g:airline_section_x = ""		      " hidden the x section in b airline
let g:airline_section_y = "" 		      " hidden the y section in b airline
let g:airline_section_z = "" 		      " hidden the z section in b airline


"strip spaces
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1


" Config CtrlSF
" key masps
nmap     <leader>ff <Plug>CtrlSFPrompt
vmap     <leader>ff <Plug>CtrlSFVwordPath
vmap     <leader>fF <Plug>CtrlSFVwordExec
nmap     <leader>fn <Plug>CtrlSFCwordPath
nmap     <leader>fp <Plug>CtrlSFPwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>

" ctrlsf vim Config
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_case_sensitive = 'yes'
let g:ctrlsf_auto_focus = {
	\ "at": "start"
	\ }
let g:ctrlsf_mapping = {
	\ "split": "x",
	\ "vsplit": "v",
	\}
" emmet
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Undo tree
nnoremap <leader>u :UndotreeToggle<cr>:UndotreeFocus<cr>

" complete me
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
nnoremap gyd :YcmCompleter GetDoc<CR>
nnoremap gyf :YcmCompleter GoToDefinition<CR>
nnoremap gyr :YcmCompleter GoToReferences<CR>
nnoremap gym :YcmCompleter RefactorRename 
nmap <leader>yq :pclose<CR>

" move lines.
let g:move_key_modifier = 'A'

" fzf
nnoremap <C-p> :Files<CR>
nnoremap gbf :Buffer<CR>
nnoremap <C-t> :Windows<CR>

