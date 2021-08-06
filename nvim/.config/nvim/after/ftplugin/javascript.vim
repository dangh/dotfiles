" vim:fileencoding=utf-8:foldmethod=marker

set expandtab "insert spaces when press <TAB> (leave it to polyglot)
set tabstop=2 "show tab as 2 spaces
set softtabstop=2 "insert 2 spaces when press <TAB>
set shiftwidth=2 "wrap line indent by 2 spaces
set number relativenumber
set foldmethod=syntax
set foldnestmax=1
set cinoptions=:0 "put case statement on the same indent as switch
set foldtext=getline(v:foldstart)
set signcolumn=yes
