" vim:fileencoding=utf-8:foldmethod=marker

source ~/.config/nvim/dangh.vim

": Auto reload {{{
augroup auto_source_vimrc_on_save
	autocmd!
	autocmd BufWritePost init.vim if has('nvim') | source % | if exists('*Powerline') | call Powerline() | endif | endif
	autocmd BufWritePost dangh.vim if has('nvim') | source % | if exists('*Powerline') | call Powerline() | endif | endif
augroup END
": }}}

": Treesitter {{{
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
}
EOF
": }}}

": Filetype hooks {{{
let g:fthook={}
function! g:fthook._(_)
	if &modifiable
		setlocal number relativenumber
		set signcolumn=no
	endif
endfunction
function! g:fthook.help(_)
	wincmd L
	vertical resize 80
	setlocal list listchars+=tab:\ \  "hide tabs but allow cursor moving to first col
endfunction
function! g:fthook.vue(_)
	setlocal nofoldenable
endfunction
Plug 't9md/vim-fthook'
": }}}

": Telescope {{{
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
": }}}
