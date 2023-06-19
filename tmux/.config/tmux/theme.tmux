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

source-file $HOME/.config/tmux/theme/util.tmux
source-file $HOME/.config/tmux/theme/status-left.tmux
source-file $HOME/.config/tmux/theme/status-right.tmux
source-file $HOME/.config/tmux/theme/window-status.tmux
source-file $HOME/.config/tmux/theme/window-status-current.tmux
source-file $HOME/.config/tmux/theme/window-status-separator.tmux
source-file $HOME/.config/tmux/theme/pane-border.tmux
