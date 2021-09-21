" vim:fileencoding=utf-8:foldmethod=marker

": Environment {{{

let g:env = {}
function! g:env.gui()
	return has('gui_running')
endfunction
function! g:env.vim()
	return !has('nvim')
endfunction
function! g:env.nvim()
	return has('nvim')
endfunction
function! g:env.mvim()
	return has('gui_macvim')
endfunction
function! g:env.tmux()
	return exists('$TMUX') && !ENV('gui')
endfunction
function! g:env.truecolor()
	return has('termguicolors') && !ENV('apple_term')
endfunction
function! g:env.apple_term()
	return ($TERM_PROGRAM == 'Apple_Terminal') && !ENV('gui')
endfunction

function! ENV(patterns)
	let patterns = split(tolower(a:patterns), ',')
	for pattern in patterns
		if !has_key(g:env, pattern)
			return v:false
		endif
		if type(g:env[pattern]) == v:t_func
			let g:env[pattern] = g:env[pattern]()
		endif
		if !g:env[pattern]
			return v:false
		endif
	endfor
	return v:true
endfunction

": }}}

": Autoreload {{{

function! Reload(env)
	if ENV(a:env)
		source %
	endif
	if exists('*LightlinePowerline')
		call LightlinePowerline()
	endif
	if exists('*TmuxlinePowerline')
		call TmuxlinePowerline()
	endif
endfunction

"augroup auto_reload
"	autocmd!
"	autocmd BufWritePost dangh.vim call Reload('')
"	autocmd BufWritePost .vimrc call Reload('vim')
"	autocmd BufWritePost init.vim call Reload('nvim')
"augroup END

": }}}

": AutoPlug {{{

function! PlugDir(name) abort
	if has('nvim')
		return expand('~/.local/share/nvim/site/pack/plugged/opt/').a:name
	else
		return expand('~/.vim/pack/plugged/opt/').a:name
	endif
endfunction

function! Plug(repo, ...) abort
	let url = 'https://github.com/'.a:repo
	let opt = {
				\'as':fnamemodify(a:repo, ':t'),
				\'branch':'master',
				\}
	if a:0 == 1
		call extend(opt, a:1)
	endif
	let name = opt.as
	let branch = opt.branch
	let dir = PlugDir(name)
	let do_postinstall = 0
	if !isdirectory(dir)
		echomsg '['.a:repo.'] installing... '
		call system('git clone -q --depth 1 --single-branch --branch '.branch.' '.url.' '.dir)
		echon 'done'
		let do_postinstall = 1
	endif
	execute 'packadd '.name
	if do_postinstall
		if isdirectory(dir.'/doc')
			silent! execute 'helptags ++t '.dir.'/doc'
		endif
		if has_key(opt, 'do')
			echomsg '['.a:repo.'] running post-install hook... '
			execute 'cd '.dir
			let type = type(opt.do)
			if type == v:t_string
				if opt.do[0] == ':'
					execute opt.do[1:]
				else
					execute '!'.opt.do
				endif
			elseif type == v:t_func
				call opt.do({ 'status': 'installed' })
			endif
			cd -
			echon 'done'
		endif
	endif
endfunction

function! PlugUpdate(...) abort
	let repos = [0]
	if a:0 > 0
		let repos = map(copy(a:000), { _, val -> PlugDir(fnamemodify(val, ':t')) })
	else
		let repos = glob(PlugDir('*'), v:false, v:true)
	endif
	for dir in repos
		execute 'cd '.dir
		let url = systemlist('git remote get-url origin')[0]
		let repo = matchstr(url, '[^/]\+/[^/]\+$')
		echomsg '['.repo.'] updating... '
		execute 'cd '.dir
		call system('git pull --depth 1')
		cd -
		echon 'done'
		if isdirectory(dir.'/doc')
			silent! execute 'helptags ++t '.dir.'/doc'
		endif
	endfor
endfunction

command! -nargs=+ Plug :call Plug(<args>)
command! -complete=packadd -nargs=* PlugUpdate :call PlugUpdate(<args>)

": }}}

": General config {{{

if ENV('truecolor')
	set termguicolors
end

if &compatible
	set nocompatible
endif

filetype plugin indent on
syntax on
set background=dark

set noswapfile "use memory only
set autoindent "indent according to previous line
set smartindent "auto indent after open bracket
"set signcolumn=yes "always show sign column
set splitright "split pane show on the right
set splitbelow "split pane show below
set showtabline=1 "only show tab bar when there are more than one tab
set laststatus=2 "always show status bar
set wildmenu "show command autocomplete
set virtualedit+=onemore "make $ go to EOL
set incsearch "highlight when searching with /
set hlsearch "highlight all matches when searching with /
set wrapscan "search wrap around at EOF
set ignorecase "search are case insensitive
set smartcase "unless they contain at least one capital letter
"set cursorline "highlight current line
set list "show non-printable characters
set listchars=tab:>\ ,
set ttyfast "faster redrawing
set lazyredraw "only redraw when necessary
set backspace=indent,eol,start "allow backspace to delete indent,eol,start in insert mode
set textwidth=0 "disable hard wrapping
set formatoptions-=c "disable hard wrapping comment
set scrolloff=5 "always show 5 lines of context when scrolling
set mouse=a "enable mouse in all modes so we can scroll inside tmux
set fillchars+=vert:│ "better split border
if has('patch2508') || has('nvim')
	set fillchars+=eob:\ , "hide tildes
endif
"set wildignore+=*/web/*
"set wildignore+=*.jpg,*.png,*.gif,*.webp,*.tgz
set wrap "enable softwrap
set breakindent "indent wrapped line at the same level
set sessionoptions=tabpages "only save open files and cwd
set shortmess+=I "disable intro message
set title
set titlestring=%{substitute(getcwd(),\ $HOME,\ '～',\ '')}

if ENV('tmux')
	"show extra blank line below status line for aesthetic purpose
	"useful when tmux's status line is at the bottom
	set cmdheight=2
	"set special title for tmux
	set title titlestring=@vim@%{expand('%:p')}
endif

": }}}

": Colorscheme {{{

Plug 'sainnhe/everforest'

let g:everforest_enable_italic = 1
let g:everforest_disable_italic_comment = 0
let g:everforest_better_performance = 1
let g:everforest_sign_column_background = 'none'
let g:everforest_current_word = 'underline'
if ENV('truecolor')
	let g:everforest_background = 'hard'
else
	let g:everforest_transparent_background = 1
	set nocursorline
endif
colorscheme everforest

": }}}

": Powerline symbols {{{

let g:powerline_symbols = {
			\'arrow' : [ '', '', '', '' ],
			\'curve' : [ '', '', '', '' ],
			\'slant' : [ '', '', '', '', '', '', '', '' ],
			\}

function! PowerlineSymbols(style)
	let symbols = get(g:powerline_symbols, a:style, [])
	let [bottom_left, bottom_left_alt, bottom_right_alt, bottom_right, top_left, top_left_alt, top_right_alt, top_right] = [0, 1, 2, 3, 4, 5, 6, 7]
	return {
				\'bottom_left'      : get(symbols, bottom_left,      ''),
				\'bottom_left_alt'  : get(symbols, bottom_left_alt,  ''),
				\'bottom_right_alt' : get(symbols, bottom_right_alt, ''),
				\'bottom_right'     : get(symbols, bottom_right,     ''),
				\'top_left'         : get(symbols, top_left,         get(symbols, bottom_left,      '')),
				\'top_left_alt'     : get(symbols, top_left_alt,     get(symbols, bottom_left_alt,  '')),
				\'top_right_alt'    : get(symbols, top_right_alt,    get(symbols, bottom_right_alt, '')),
				\'top_right'        : get(symbols, top_right,        get(symbols, bottom_right,     '')),
				\}
endfunction

function! Powerline(...)
	if exists('*LightlinePowerline')
		if a:0 > 0
			call call('LightlinePowerline', a:000)
		elseif exists('g:lightline_powerline')
			LightlinePowerline(g:lightline_powerline)
		endif
	endif
	if exists('*TmuxlinePowerline')
		if a:0 > 0
			call call('TmuxlinePowerline', a:000)
		elseif exists('g:tmuxline_powerline')
			TmuxlinePowerline(g:tmuxline_powerline')
		endif
	endif
endfunction

function! PowerlineCompletion(...)
	return keys(g:powerline_symbols) + ['none']
endfunction

command! -complete=customlist,PowerlineCompletion -nargs=1 Powerline :call Powerline(<q-args>)

": }}}

": Lightline {{{

let g:lightline = {
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
let g:lightline.colorscheme = 'everforest'
let g:lightline.active.left = [[ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ]]
let g:lightline.inactive.left = [[], [ 'relativepath' ]]
let g:lightline.tabline.right = [[ 'pwd' ]]
let g:lightline.component_function.pwd = 'LightlinePwd'
let g:lightline.component_function.relativepath = 'LightlineRelativePath'

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
		return '～/'.path[len(home)+1:]
	endif
	return expand('%')
endfunction

Plug 'itchyny/lightline.vim'
call add(g:lightline#colorscheme#everforest#palette.tabline.right[0], 'bold')
call lightline#init()
call lightline#colorscheme()

function! LightlinePowerline(...)
	if a:0 > 0
		let g:lightline_powerline = a:1
	endif
	let symbols = PowerlineSymbols(g:lightline_powerline)
	let g:lightline.separator            = { 'left': symbols.bottom_left,     'right': symbols.bottom_right     }
	let g:lightline.subseparator         = { 'left': symbols.bottom_left_alt, 'right': symbols.bottom_right_alt }
	let g:lightline.tabline_separator    = { 'left': symbols.top_left,        'right': symbols.top_right        }
	let g:lightline.tabline_subseparator = { 'left': symbols.top_left_alt,    'right': symbols.top_right_alt    }
	call lightline#init()
	call lightline#colorscheme()
	call lightline#update()
endfunction
command! -complete=customlist,PowerlineCompletion -nargs=1 LightlinePowerline :call LightlinePowerline(<q-args>)
call LightlinePowerline(get(g:, 'lightline_powerline', 'curve'))

": }}}

": Tmux status line {{{

if ENV('tmux')
	Plug 'edkolev/tmuxline.vim'
	function! TmuxlinePowerline(...)
		if a:0 > 0
			let g:tmuxline_powerline = a:1
		endif

		let position = 'bottom'
		if a:0 > 1
			let position = a:2
		endif

		let symbols = PowerlineSymbols(get(g:, 'tmuxline_powerline'))
		let g:tmuxline_separators = {
					\'left'      : symbols[position.'_left'],
					\'left_alt'  : symbols[position.'_left_alt'],
					\'right'     : symbols[position.'_right'],
					\'right_alt' : symbols[position.'_right_alt'],
					\'space'     : ' ',
					\}

		let palette = lightline#palette()
		let colors = tmuxline#util#create_theme_from_lightline(extend(deepcopy(palette.normal), palette.command))
		let colors.cwin[0] = colors.a[1] "make current window text use primary color

		let line = tmuxline#new()
		let line.win_options['window-status-activity-style'] = 'none'
		let line.win_options['status-position'] = position
		call line.left.add('a', '#{session_name}')
		call line.left.add_left_sep()
		call line.left.add('b', '')
		call line.left.add_left_sep()
		call line.right.add('x', '%a, %b %d')
		call line.right.add_right_sep()
		call line.right.add('y', '')
		call line.right.add_right_sep()
		call line.right.add('z', '%-l:%M')
		if get(g:, 'tmuxline_powerline') == 'slant'
			call line.win.add_left_sep()
		else
			call line.win.add_right_sep()
		endif
		let window_index = join([
					\'#{',
						\'s|0|０|;',
						\'s|1|１|;',
						\'s|2|２|;',
						\'s|3|３|;',
						\'s|4|４|;',
						\'s|5|５|;',
						\'s|6|６|;',
						\'s|7|７|;',
						\'s|8|８|;',
						\'s|9|９|:',
						\'#{window_index}',
					\'}',
					\'.',
					\], '')
		let pane_current_path = join([
					\'#{',
						\'s|^$HOME|～|;',
						\'s|^~|～|;',
						\'s|^.*/\\.ws/([^/]+)|\\1|;',
						\'s|/|//|;',
						\'s|/([^A-Za-z0-9/]*[A-Za-z0-9])[^/]*/|\\1/|;',
						\'s|//|/|;',
						\'s|[^/]+$|#[bold]\\0#[nobold]|:',
						\'#{?',
							\'#{m|r:^@vim@,#{pane_title}},',
							\'#{s|^@vim@||:#{pane_title}},',
							\'#{pane_current_path}',
						\'}',
					\'}',
					\'#{?',
						\'#{m|r:Z,#{window_flags}},',
						\'  ,',
					\'}',
					\], '')
		call line.win.add('win', window_index)
		call line.win.add('win', pane_current_path)
		if get(g:, 'tmuxline_powerline') == 'slant'
			call line.win.add_right_sep()
		else
			call line.win.add_left_sep()
		endif
		if get(g:, 'tmuxline_powerline') == 'slant'
			call line.cwin.add_left_sep()
		else
			call line.cwin.add_right_sep()
		endif
		call line.cwin.add('cwin', window_index)
		call line.cwin.add('cwin', pane_current_path)
		if get(g:, 'tmuxline_powerline') == 'slant'
			call line.cwin.add_right_sep()
		else
			call line.cwin.add_left_sep()
		endif

		let separators = tmuxline#get_separators()

		call tmuxline#apply(tmuxline#get_line_settings(line, colors, separators))
	endfunction

	command! -complete=customlist,PowerlineCompletion -nargs=1 TmuxlinePowerline :call TmuxlinePowerline(<q-args>)
endif

": }}}

": Comment {{{

Plug 'tomtom/tcomment_vim'
call tcomment#type#Define('javascript', '//%s')
call tcomment#type#Define('vim', '"%s')
call tcomment#type#Define('yaml', '#%s')

": }}}

Plug 'tpope/vim-surround'

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase=1
let g:EasyMotion_use_smartsign_us=1
nmap s         <Plug>(easymotion-overwin-f2)
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
map /  <Plug>(incsearch-easymotion-/)
map ?  <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)

"let g:sneak#label = 1
"Plug 'justinmk/vim-sneak'
"map f <Plug>Sneak_f
"map F <Plug>Sneak_F
"map t <Plug>Sneak_t
"map T <Plug>Sneak_T

"Plug 'tbo/notion'
"hi NotionLabel guifg=red guibg=black ctermfg=red ctermbg=black
"nmap <silent> c :NotionJump<CR>

"motion in wrapped line without breaking <vcount>
"https://stackoverflow.com/a/21000307/1578964
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'
noremap <expr> $ v:count ? '$' : 'g$'
noremap <expr> ^ v:count ? '^' : 'g^'
noremap <expr> 0 v:count ? '0' : 'g0'

let g:tmux_navigator_no_mappings=1
let g:tmux_navigator_disable_when_zoomed=1
Plug 'christoomey/vim-tmux-navigator'
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

"make * # case-sensitive
"https://vi.stackexchange.com/a/4055
nnoremap <silent>  * :let @/='\C\<' . expand('<cword>') . '\>'<CR>:let v:searchforward=1<CR>n
nnoremap <silent>  # :let @/='\C\<' . expand('<cword>') . '\>'<CR>:let v:searchforward=0<CR>n
nnoremap <silent> g* :let @/='\C'   . expand('<cword>')       <CR>:let v:searchforward=1<CR>n
nnoremap <silent> g# :let @/='\C'   . expand('<cword>')       <CR>:let v:searchforward=0<CR>n

