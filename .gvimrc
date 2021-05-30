"set a correct size so when MacVim resize to fullscreen it doesn't mess up split panes
"run the command below to get the current window size
":echo winheight(0) winwidth(0)
"set lines=68 columns=238
set lines=70 columns=273

set guifont=Rec\ Mono\ Casual:h12
"set guifont=PragmataPro\ Mono\ Liga:h14
set linespace=1

"disable cursur blinking
set guicursor+=a:blinkon0

"disable all scrollbars
set guioptions-=l guioptions-=L guioptions-=r guioptions-=R

"disable native tabs
set guioptions-=e

if has('gui_macvim') && has('gui_running')
	set fullscreen
	set macligatures
	set macthinstrokes

	"disable MacVim menu shortcuts
	macmenu File.New\ Window key=<Nop>
	macmenu File.New\ Tab key=<Nop>
	macmenu File.Print key=<Nop>
	macmenu Tools.Older\ List key=<Nop>
	macmenu Tools.Newer\ List key=<Nop>
	macmenu Edit.Find.Find… key=<Nop>
	macmenu Edit.Font.Bigger key=<Nop>
	macmenu Edit.Font.Smaller key=<Nop>
	macmenu File.Close key=<Nop>
endif

