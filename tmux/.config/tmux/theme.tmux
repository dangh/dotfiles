#: Symbols {{{
set-option -g   @symbol_ltr_rendered     "#{?#{m|r:&#{T:@symbol_ltr}\s*=,#{T:@symbols}},"
set-option -ga  @symbol_ltr_rendered       "#{"
set-option -ga  @symbol_ltr_rendered         "s|.*&#{T:@symbol_ltr}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @symbol_ltr_rendered         ":@symbols"
set-option -ga  @symbol_ltr_rendered       "},"
set-option -ga  @symbol_ltr_rendered       "#{T:@symbol_ltr}"
set-option -ga  @symbol_ltr_rendered     "}"
set-option -g   @symbol_ltr_sep_rendered "#{?#{m|r:&#{T:@symbol_ltr_sep}\s*=,#{T:@symbols}},"
set-option -ga  @symbol_ltr_sep_rendered   "#{"
set-option -ga  @symbol_ltr_sep_rendered     "s|.*&#{T:@symbol_ltr_sep}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @symbol_ltr_sep_rendered     ":@symbols"
set-option -ga  @symbol_ltr_sep_rendered   "},"
set-option -ga  @symbol_ltr_sep_rendered   "#{T:@symbol_ltr_sep}"
set-option -ga  @symbol_ltr_sep_rendered "}"
set-option -g   @symbol_rtl_rendered     "#{?#{m|r:&#{T:@symbol_rtl}\s*=,#{T:@symbols}},"
set-option -ga  @symbol_rtl_rendered       "#{"
set-option -ga  @symbol_rtl_rendered         "s|.*&#{T:@symbol_rtl}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @symbol_rtl_rendered         ":@symbols"
set-option -ga  @symbol_rtl_rendered       "},"
set-option -ga  @symbol_rtl_rendered       "#{T:@symbol_rtl}"
set-option -ga  @symbol_rtl_rendered     "}"
set-option -g   @symbol_rtl_sep_rendered "#{?#{m|r:&#{T:@symbol_rtl_sep}\s*=,#{T:@symbols}},"
set-option -ga  @symbol_rtl_sep_rendered   "#{"
set-option -ga  @symbol_rtl_sep_rendered     "s|.*&#{T:@symbol_rtl_sep}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @symbol_rtl_sep_rendered     ":@symbols"
set-option -ga  @symbol_rtl_sep_rendered   "},"
set-option -ga  @symbol_rtl_sep_rendered   "#{T:@symbol_rtl_sep}"
set-option -ga  @symbol_rtl_sep_rendered "}"
#: }}}

set-option -g   mode-style                    " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@selection_fg}}"
set-option -ga  mode-style                    " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@selection_bg}}"
set-option -g   copy-mode-match-style         " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@search_match_fg}}"
set-option -ga  copy-mode-match-style         " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@search_match_bg}}"
set-option -g   copy-mode-current-match-style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@search_current_match_fg}}"
set-option -ga  copy-mode-current-match-style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@search_current_match_bg}}"
set-option -g   message-style                 " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@message_fg}}"
set-option -ga  message-style                 " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@message_bg}}"
set-option -g   message-command-style         " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@message_command_fg}}"
set-option -ga  message-command-style         " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@message_command_bg}}"
set-option -g   pane-border-style             " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@pane_border_fg}}"
set-option -ga  pane-border-style             " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@pane_border_bg}}"
set-option -g   pane-active-border-style      " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@active_pane_border_fg}}"
set-option -ga  pane-active-border-style      " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@active_pane_border_bg}}"

#: Helpers {{{
set-option -wg  @before_active_window        "#{>:0,#{e|-|:#{window_index},#{active_window_index}}}"
set-option -wg  @after_active_window         "#{<:0,#{e|-|:#{window_index},#{active_window_index}}}"
set-option -wg  @window_renamed "#{!=:#{window_name},}"
#: }}}
#: Styled pane current path {{{
set-option -wg  @pane_current_path ""
set-option -wga @pane_current_path "#{?"
set-option -wga @pane_current_path   "#{m|r:^@vim@,#{pane_title}},"
set-option -wga @pane_current_path   "#{s|^@vim@||:#{pane_title}},"
set-option -wga @pane_current_path   "#{pane_current_path}"
set-option -wga @pane_current_path "}"
set-option -wg  @pane_current_path_styled ""
set-option -wga @pane_current_path_styled "#{s|^$HOME|～|;"
set-option -wga @pane_current_path_styled   "s|^~|～|;"
set-option -wga @pane_current_path_styled   "s|^.*/\\.ws/([^/]+)|\\1|;"
set-option -wga @pane_current_path_styled   "s|/|//|;"
set-option -wga @pane_current_path_styled   "s|/([^A-Za-z0-9/]*[A-Za-z0-9])[^/]*/|\\1/|;"
set-option -wga @pane_current_path_styled   "s|//|/|;"
set-option -wga @pane_current_path_styled   "s|[^/]+$|#[bold]\\0#[nobold]|:"
set-option -wga @pane_current_path_styled     "#{T:@pane_current_path}"
set-option -wga @pane_current_path_styled "}"
#: }}}
#: Styled window index {{{
set-option -wg  @window_index_fwid ""
set-option -wga @window_index_fwid "#{"
set-option -wga @window_index_fwid   "s|0|０|;"
set-option -wga @window_index_fwid   "s|1|１|;"
set-option -wga @window_index_fwid   "s|2|２|;"
set-option -wga @window_index_fwid   "s|3|３|;"
set-option -wga @window_index_fwid   "s|4|４|;"
set-option -wga @window_index_fwid   "s|5|５|;"
set-option -wga @window_index_fwid   "s|6|６|;"
set-option -wga @window_index_fwid   "s|7|７|;"
set-option -wga @window_index_fwid   "s|8|８|;"
set-option -wga @window_index_fwid   "s|9|９|;"
set-option -wga @window_index_fwid   ":window_index"
set-option -wga @window_index_fwid "}"
#: }}}
#: Styled pane index {{{
set-option -g  @pane_index_fwid ""
set-option -ga @pane_index_fwid "#{"
set-option -ga @pane_index_fwid   "s|0|０|;"
set-option -ga @pane_index_fwid   "s|1|１|;"
set-option -ga @pane_index_fwid   "s|2|２|;"
set-option -ga @pane_index_fwid   "s|3|３|;"
set-option -ga @pane_index_fwid   "s|4|４|;"
set-option -ga @pane_index_fwid   "s|5|５|;"
set-option -ga @pane_index_fwid   "s|6|６|;"
set-option -ga @pane_index_fwid   "s|7|７|;"
set-option -ga @pane_index_fwid   "s|8|８|;"
set-option -ga @pane_index_fwid   "s|9|９|;"
set-option -ga @pane_index_fwid   ":pane_index"
set-option -ga @pane_index_fwid "}"
#: }}}
#: Styled window flags {{{
set-option -g   @window_flags_fwid ""
set-option -ga  @window_flags_fwid "#{"
set-option -ga  @window_flags_fwid   "s|#|＃|;" # window activity
set-option -ga  @window_flags_fwid   "s|!|！|;" # window bell
set-option -ga  @window_flags_fwid   "s|~|～|;" # window silence
set-option -ga  @window_flags_fwid   "s|\\*|＊|;" # current window
set-option -ga  @window_flags_fwid   "s|-|－|;" # last window
set-option -ga  @window_flags_fwid   "s|M|Ｍ|;" # window marked
set-option -ga  @window_flags_fwid   "s|Z|Ｚ|;" # window zoomed
set-option -ga  @window_flags_fwid   ":window_raw_flags"
set-option -ga  @window_flags_fwid "}"
set-option -g   @window_zoomed_icon "#{?window_zoomed_flag,  ,}"
set-option -wg  automatic-rename-format ""
#: }}}
#: Format status line {{{
set-option -g   status on
set-option -g   status-left-length 100
set-option -g   status-right-length 100
set-option -g   status-justify absolute-centre
set-option -gF  status-style "#{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_bg}}"
set-option -gF  status-left-style none
set-option -gF  status-right-style none
set-option -gF  window-status-activity-style none
set-option -gF  window-status-style none
set-option -g   pane-border-status top
#: }}}

set-option -g status-interval 1

source-file $HOME/.config/tmux/theme/status-left.tmux
source-file $HOME/.config/tmux/theme/status-right.tmux
source-file $HOME/.config/tmux/theme/window-status.tmux
source-file $HOME/.config/tmux/theme/window-status-current.tmux
source-file $HOME/.config/tmux/theme/window-status-separator.tmux
source-file $HOME/.config/tmux/theme/pane-border.tmux
