" vim:fileencoding=utf-8:foldmethod=marker
scriptencoding utf-8
set encoding=utf-8

"CROSS PLATFORM COMPATIBLE {{{

let truecolor=(has('termguicolors') && (has('gui_running') || ($TERM_PROGRAM !=# 'Apple_Terminal')))
let can_map_super=has('gui_running')
let is_macvim=has('gui_macvim') && has('gui_running')

"fix italic in terminal
"https://stackoverflow.com/a/53625973/1578964
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"CROSS PLATFORM COMPATIBLE }}}

"AutoPlug {{{
function! Plug(repo, ...) abort
	let l:url='https://github.com/'.a:repo
	let l:opt={
				\'as':fnamemodify(a:repo, ':t'),
				\}
	if a:0 == 1
		call extend(l:opt, a:1)
	endif
	let l:name=l:opt.as
	let l:dir=expand('~/.vim/pack/plugged/opt/'.l:name)
	let l:do_postinstall=0
	if !isdirectory(l:dir)
		echomsg '['.a:repo.'] installing... '
		call system('git clone -q --depth 1 '.l:url.' '.l:dir)
		echon 'done'
		let l:do_postinstall=1
	endif
	execute 'packadd '.l:name
	if l:do_postinstall
		if isdirectory(l:dir.'/doc')
			silent! execute 'helptags ++t '.l:dir.'/doc'
		endif
		if has_key(l:opt, 'do')
			echomsg '['.a:repo.'] running post-install hook... '
			execute 'cd '.l:dir
			let type=type(l:opt.do)
			if type == v:t_string
				if l:opt.do[0] == ':'
					execute l:opt.do[1:]
				else
					execute '!'.l:opt.do
				endif
			elseif type == v:t_func
				call l:opt.do({ 'status': 'installed' })
			endif
			cd -
			echon 'done'
		endif
	endif
endfunction
function! PlugUpdate(...) abort
	let l:repos=[0]
	if a:0 > 0
		let l:repos=map(copy(a:000), { _, val -> expand('~/.vim/pack/plugged/opt/'.fnamemodify(val, ':t')) })
	else
		let l:repos=glob('~/.vim/pack/plugged/opt/*', v:false, v:true)
	endif
	for l:dir in l:repos
		execute 'cd '.l:dir
		let l:url=systemlist('git remote get-url origin')[0]
		let l:repo=matchstr(l:url, '[^/]\+/[^/]\+$')
		echomsg '['.l:repo.'] updating... '
		execute 'cd '.l:dir
		call system('git pull --depth 1')
		cd -
		echon 'done'
		if isdirectory(l:dir.'/doc')
			silent! execute 'helptags ++t '.l:dir.'/doc'
		endif
	endfor
endfunction
command! -nargs=+ Plug :call Plug(<args>)
command! -nargs=* PlugUpdate :call PlugUpdate(<args>)
"AutoPlug }}}

"VIMRC {{{
if !exists('*ReSourceVimrc')
	function ReSourceVimrc()
		source $MYVIMRC
		if exists('*lightline#init')
			call lightline#init()
			call lightline#colorscheme()
			call lightline#update()
		endif
	endfunction
endif
augroup auto_source_vimrc_on_save
	autocmd!
	autocmd BufWritePost .vimrc call ReSourceVimrc()
	autocmd BufWritePost .gvimrc source %
augroup END
noremap <silent> <expr> <F10>
			\	tabpagenr() < tabpagenr('$')
			\		? ':tablast<CR> :tabnew ~/.gvimrc<CR> :160vsp $MYVIMRC<CR>'
			\		: ':tabnew ~/.gvimrc<CR>:160vsp $MYVIMRC<CR>'
noremap! <silent> <expr> <F10>
			\	tabpagenr() < tabpagenr('$')
			\		? '<Esc> :tablast<CR> :tabnew ~/.gvimrc<CR> :160vsp $MYVIMRC<CR>'
			\		: '<Esc> :tabnew ~/.gvimrc<CR>:160vsp $MYVIMRC<CR>'
"VIMRC }}}

"PLUGIN TWEAKS {{{
"let g:loaded_getscriptPlugin=1
"let g:loaded_gzip=1
"let g:loaded_logiPat=1
let g:matchparen_timeout=20 | let g:matchparen_insert_timeout=20 "give up matching parenthesis if it took too long
let g:loaded_netrwPlugin=1
"let g:loaded_rrhelper=1
"let g:loaded_spellfile_plugin=1
"let g:loaded_tarPlugin=1
"let g:loaded_2html_plugin=1
"let g:loaded_vimballPlugin=1
"let g:loaded_zipPlugin=1
"PLUGIN TWEAKS }}}

"general config {{{

augroup enforce_zero_textwidth
	autocmd!
	"something keep overrides textwidth for vim language
	"force reset textwidth on buffer open
	autocmd BufReadPost,BufEnter,FocusGained,InsertLeave * set textwidth=0
augroup END

if truecolor
	set termguicolors
end

if &compatible
	set nocompatible
endif

syntax on
set background=dark

set noswapfile "use memory only
set autoindent "indent according to previous line
set smartindent "auto indent after open bracket
"set expandtab "insert spaces when press <TAB> (leave it to polyglot)
set tabstop=2 "show tab as 2 spaces
set softtabstop=2 "insert 2 spaces when press <TAB>
set shiftwidth=2 "wrap line indent by 2 spaces
"set number relativenumber "(leave it to augroup above)
set signcolumn=auto "only show sign column when needed
set splitright "split pane show on the right
set splitbelow "split pane show below
set showtabline=2 "always show tab bar
set laststatus=2 "always show status bar
set wildmenu "show command autocomplete
set virtualedit+=onemore "make $ go to EOL
set incsearch "highlight when searching with /
set hlsearch "highlight all matches when searching with /
set wrapscan "search wrap around at EOF
set ignorecase "search are case insensitive
set smartcase "unless they contain at least one capital letter
set cursorline "highlight current line
set list "show non-printable characters
set listchars=tab:>\ ,
set ttyfast "faster redrawing
set lazyredraw "only redraw when necessary
set backspace=indent,eol,start "allow backspace to delete indent,eol,start in insert mode
set textwidth=0 "disable hard wrapping
set formatoptions-=c "disable hard wrapping comment
set scrolloff=5 "always show 3 lines of context when scrolling
set mouse=a "enable mouse in all modes so we can scroll inside tmux
set fillchars+=vert:│ "better split border
if has('patch2508')
	set fillchars+=eob:\ , "hide tildes
endif
"set wildignore+=*/web/*
"set wildignore+=*.jpg,*.png,*.gif,*.webp,*.tgz
set wrap "enable softwrap
set breakindent "indent wrapped line at the same level
set sessionoptions=tabpages "only save open files and cwd

"}}} general config


if is_macvim
	let g:last_cwd=expand('~/.vim/last_cwd')
	function! s:restore_cwd()
		if !argc() && filereadable(g:last_cwd)
			let l:cwd=readfile(g:last_cwd)[0]
			echomsg 'Restore working dir '.l:cwd
			execute 'cd '.l:cwd
		endif
	endfunction
	function! s:store_cwd()
		call writefile([getcwd()], g:last_cwd)
	endfunction
	augroup last_cwd
		autocmd!
		autocmd VimEnter * call s:restore_cwd()
		autocmd VimLeave * call s:store_cwd()
	augroup END
endif
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'


let g:polyglot_disabled = ['javascript']
let g:vue_pre_processors = []
Plug 'sheerun/vim-polyglot'


Plug 'dangh/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'RRethy/vim-illuminate'
Plug 'tpope/vim-abolish'
Plug 'michaeljsmith/vim-indent-object'
Plug 'pbrisbin/vim-mkdir'


Plug 'tomtom/tcomment_vim'
call tcomment#type#Define('javascript', '//%s')
call tcomment#type#Define('vim', '"%s')
call tcomment#type#Define('yaml', '#%s')


Plug 'mhinz/vim-signify'
set updatetime=100

if can_map_super
	let g:VM_maps={
				\'Find Under': '<D-d>',
				\'Find Subword Under': '<D-d>',
				\'Select All': '<C-D-g>',
				\}
endif
Plug 'mg979/vim-visual-multi'


let g:ctrlsf_auto_focus={'at': 'start'}
Plug 'dyng/ctrlsf.vim'
nnoremap <D-F> <Plug>CtrlSFPrompt
inoremap <D-F> <Esc><Plug>CtrlSFPrompt
vnoremap <D-F> <Plug>CtrlSFVwordExec


Plug 'hrsh7th/vim-vsnip'
imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
let g:lsp_diagnostics_enabled=0
let g:lsp_document_highlight_enabled=0
augroup lsp_config
	autocmd!
	autocmd User lsp_float_opened
				\ call popup_setoptions(lsp#ui#vim#output#getpreviewwinid(), {
				\ 	'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
				\ 	'padding': [0,1,0,1],
				\ 	'highlight': 'Constant',
				\ })
augroup END


Plug 'sainnhe/everforest'
let g:everforest_enable_italic=1
let g:everforest_disable_italic_comment=0
let g:everforest_better_performance=1
let g:everforest_sign_column_background='none'
let g:everforest_current_word='underline'
if truecolor
	let g:everforest_background='hard'
else
	let g:everforest_transparent_background=1
	set nocursorline
endif
colorscheme everforest
highlight! link jsFuncCall Purple
highlight! link jsString GreenItalic
highlight! link jsBlock Blue
highlight! link jsFuncBlock Blue
highlight! link jsTryCatchBlock Blue
highlight! link jsSwitchBlock Blue
highlight! link jsIfElseBlock Blue
highlight! link jsRepeatBlock Blue


let g:lightline={
			\'active': {},
			\'inactive': {},
			\'tabline': {},
			\'component_function': {},
			\'component_expand': {},
			\'component_type': {},
			\'separator': {},
			\'subseparator': {},
			\'tabline_separator': {},
			\'tabline_subseparator': {},
			\}
let g:lightline.colorscheme='everforest'
let g:lightline_style='slant'
let g:lightline_separators={
			\'slant': [ "\ue0b8", "\ue0b9", "\ue0bb" , "\ue0ba", "\ue0bc", "\ue0bd", "\ue0bf", "\ue0be" ],
			\'arrow': [ "\ue0b0", "\ue0b1", "\ue0b3" , "\ue0b2" ],
			\'curve': [ "\ue0b4", "\ue0b5", "\ue0b7" , "\ue0b6" ],
			\}
if has_key(g:lightline_separators, get(g:, 'lightline_style', ''))
	let symbols = g:lightline_separators[g:lightline_style]
	let g:lightline.separator = { 'left': symbols[0], 'right': symbols[3] }
	let g:lightline.subseparator = { 'left': symbols[1], 'right': symbols[2] }
	if len(symbols) > 4
		let g:lightline.tabline_separator = { 'left': symbols[4], 'right': symbols[7] }
		let g:lightline.tabline_subseparator = { 'left': symbols[5], 'right': symbols[6] }
	else
		let g:lightline.tabline_separator = { 'left': symbols[0], 'right': symbols[3] }
		let g:lightline.tabline_subseparator = { 'left': symbols[1], 'right': symbols[2] }
	endif
endif
let g:lightline.active.left=[[ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ]]
let g:lightline.inactive.left=[[], [ 'relativepath' ]]
let g:lightline.tabline.right=[[ 'pwd' ]]
let g:lightline.component_function.pwd='LightlinePwd'
let g:lightline.component_function.relativepath='LightlineRelativePath'
function! LightlinePwd()
	return fnamemodify(getcwd(), ':t')
endfunction
function! LightlineRelativePath()
	let home = expand('~')
	let root = getcwd()
	let path = expand('%:p')
	if path[:len(root)-1] ==# root
		return path[len(root)+1:]
	endif
	if path[:len(home)-1] ==# home
		return '~/'.path[len(home)+1:]
	endif
	return expand('%')
endfunction
Plug 'itchyny/lightline.vim'


if executable('fd') && executable('fzy')
	let g:fzy={
				\'findcmd': 'fd -cnever -d5 -tf -ejs -ejson -eyml -emd -evue',
				\'lines': 20,
				\'popupwin': 1,
				\'term_highlight': 'Conceal',
				\'popup': {
					\	'highlight': 'Constant',
					\	'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
					\	'maxwidth': 120,
					\	'minwidth': 120,
					\	'maxheight': 20,
					\	'minheight': 20,
					\	},
					\}
	Plug 'bfrg/vim-fzy'
	noremap <D-P> :FzyOldfiles<CR>
	noremap <D-p> :FzyFind<CR>
	noremap <D-t> :FzyBuffer<CR>
	noremap <D-H> :FzyHelp<CR>
	noremap! <D-P> <Esc>:FzyOldfiles<CR>
	noremap! <D-p> <Esc>:FzyFind<CR>
	noremap! <D-t> <Esc>:FzyBuffer<CR>
	noremap! <D-H> <Esc>:FzyHelp<CR>
endif


Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_match_window='order:ttb'
let g:ctrlp_use_caching=0
Plug 'dangh/ctrlp-funky'
let g:ctrlp_funky_matchtype='path'
let g:ctrlp_funky_syntax_highlight=1
let g:ctrlp_funky_after_jump = 'zozt'
let g:ctrlp_funky_nolim=1
noremap <D-r> :CtrlPFunky<CR>
nnoremap <F12> :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase=1
let g:EasyMotion_use_smartsign_us=1
nmap s <Plug>(easymotion-overwin-f2)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map  <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)


Plug 'haya14busa/incsearch.vim'
let g:incsearch#auto_nohlsearch=1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
Plug 'haya14busa/incsearch-easymotion.vim'
map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)


let g:fthook={}
function! g:fthook._(_)
	if &modifiable
		setlocal number relativenumber
	endif
endfunction
function! g:fthook.help(_)
	wincmd L
	vertical resize 80
	setlocal list listchars+=tab:\ \  "hide tabs but allow cursor moving to first col
endfunction
function! g:fthook.javascript(_)
	setlocal foldmethod=syntax foldnestmax=1
	setlocal signcolumn=yes
endfunction
function! g:fthook.vue(_)
	setlocal nofoldenable
endfunction
Plug 't9md/vim-fthook'


"GUI KEY MAPS {{{1

"Cmd+w delete buffer instead of quit, so we have an empty buffer when last file closed
noremap  <silent> <expr> <D-w> tabpagewinnr(0)==1 ?      ':bd<CR>' :      ':q<CR>'
noremap! <silent> <expr> <D-w> tabpagewinnr(0)==1 ? '<Esc>:bd<CR>' : '<Esc>:q<CR>'

"window navigation with Ctrl-[hjkl]
for c in ['h', 'j', 'k', 'l']
	execute 'noremap <C-'.c.'> <C-w>'.c
	execute 'noremap! <C-'.c.'> <Esc><C-w>'.c
endfor

"transpose characters
nnoremap <silent> <C-t>      xph
inoremap <silent> <C-t> <Esc>xpi

"prevent undo accident
nnoremap u <Nop>
vnoremap u <Nop>
nnoremap U      :undo<CR>
vnoremap U <Esc>:undo<CR>gv

"clear last search highlight
nnoremap <silent> <D-Esc>      :let @/=""<CR>
inoremap <silent> <D-Esc> <Esc>:let @/=""<CR>a
vnoremap <silent> <D-Esc>      :let @/=""<CR>gv

let macvim_hig_shift_movement=1

"Cmd+num to switch tab
for c in [1, 2, 3, 4, 5, 6, 7, 8, 9]
	execute 'noremap <D-'.c.'> '.c.'gt'
	execute 'noremap! <D-'.c.'> <Esc>'.c.'gt'
endfor
noremap <D-0> :tablast<CR>
noremap! <D-0> <Esc>:tablast<CR>

"Cmd+Shift+D to duplicate line
nnoremap <silent> <D-D>      mx:copy .<CR>`xj
inoremap <silent> <D-D> <Esc>mx:copy .<CR>`xja
vnoremap <silent> <D-D>        :copy '<-1<CR>gv

"move line up-down with Ctrl+Cmd+Up/Down
nnoremap <silent> <C-D-up>      mx:move .-2<CR>==`x
nnoremap <silent> <C-D-down>    mx:move .+1<CR>==`x
inoremap <silent> <C-D-up>   <Esc>:move .-2<CR>==gi
inoremap <silent> <C-D-down> <Esc>:move .+1<CR>==gi
vnoremap <silent> <C-D-up>        :move '<-2<CR>gv=gv
vnoremap <silent> <C-D-down>      :move '>+1<CR>gv=gv

"open terminal at current file directory
noremap  <silent> <D-R>      :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
noremap! <silent> <D-R> <Esc>:let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

"split pane
noremap  <D-_>       :new<CR>
noremap  <D-\|>      :vnew<CR>
noremap! <D-_>  <Esc>:new<CR>
noremap! <D-\|> <Esc>:vnew<CR>

noremap  <D-n>      :tabnew<CR>
noremap! <D-n> <Esc>:tabnew<CR>

"insert line above/below
noremap    <D-CR> o
noremap  <S-D-CR> O
noremap!   <D-CR> <Esc>o
noremap! <S-D-CR> <Esc>O

"}}}


"KEY MAPS {{{

"motion in wrapped line without breaking <vcount>
"https://stackoverflow.com/a/21000307/1578964
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'
noremap <expr> $ v:count ? '$' : 'g$'
noremap <expr> ^ v:count ? '^' : 'g^'
noremap <expr> 0 v:count ? '0' : 'g0'

"make * # case-sensitive
"https://vi.stackexchange.com/a/4055
nnoremap <silent>  * :let @/='\C\<' . expand('<cword>') . '\>'<CR>:let v:searchforward=1<CR>n
nnoremap <silent>  # :let @/='\C\<' . expand('<cword>') . '\>'<CR>:let v:searchforward=0<CR>n
nnoremap <silent> g* :let @/='\C'   . expand('<cword>')       <CR>:let v:searchforward=1<CR>n
nnoremap <silent> g# :let @/='\C'   . expand('<cword>')       <CR>:let v:searchforward=0<CR>n

"move to first non-whitespace character on the previous line as oppose to <CR>
nnoremap <S-CR> -

"inspect syntax highlight group
function! SynGroup()                                                            
	let l:s = synID(line('.'), col('.'), 1)                                       
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <C-P> :call SynGroup()<CR>

"}}}
