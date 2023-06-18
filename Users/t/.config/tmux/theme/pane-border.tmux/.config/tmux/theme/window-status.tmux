#: Window status {{{
set-option -wg  @window_status_fg_computed "#{s|\n*([^\n]+).*|\\1|r;s|\n*||r:"
set-option -wga @window_status_fg_computed   "\n#{?window_marked_flag,#{T:@marked_window_status_fg},}"
set-option -wga @window_status_fg_computed   "\n#{T:@window_status_fg}"
set-option -wga @window_status_fg_computed "}"
set-option -wg  @window_status_bg_computed "#{s|\n*([^\n]+).*|\\1|r;s|\n*||r:"
set-option -wga @window_status_bg_computed   "\n#{?window_marked_flag,#{T:@marked_window_status_bg},}"
set-option -wga @window_status_bg_computed   "\n#{T:@window_status_bg}"
set-option -wga @window_status_bg_computed "}"
set-option -wg  @prev_window_status_left_symbol_resolved "#{s|\n*([^\n]+).*|\\1|r;s|\n*||r:"
set-option -wga @prev_window_status_left_symbol_resolved   "\n#{T:@prev_window_status_left_symbol}"
set-option -wga @prev_window_status_left_symbol_resolved   "\n#{T:@symbol_rtl}"
set-option -wga @prev_window_status_left_symbol_resolved "}"
set-option -wg  @prev_window_status_right_symbol_resolved "#{s|\n*([^\n]+).*|\\1|r;s|\n*||r:"
set-option -wga @prev_window_status_right_symbol_resolved   "\n#{T:@prev_window_status_right_symbol}"
set-option -wga @prev_window_status_right_symbol_resolved   "\n#{T:@symbol_ltr}"
set-option -wga @prev_window_status_right_symbol_resolved "}"
set-option -wg  @next_window_status_left_symbol_resolved "#{s|\n*([^\n]+).*|\\1|r;s|\n*||r:"
set-option -wga @next_window_status_left_symbol_resolved   "\n#{T:@next_window_status_left_symbol}"
set-option -wga @next_window_status_left_symbol_resolved   "\n#{T:@symbol_rtl}"
set-option -wga @next_window_status_left_symbol_resolved "}"
set-option -wg  @next_window_status_right_symbol_resolved "#{s|\n*([^\n]+).*|\\1|r;s|\n*||r:"
set-option -wga @next_window_status_right_symbol_resolved   "\n#{T:@next_window_status_right_symbol}"
set-option -wga @next_window_status_right_symbol_resolved   "\n#{T:@symbol_ltr}"
set-option -wga @next_window_status_right_symbol_resolved "}"
set-option -wg  @prev_window_status_left_symbol_rendered "#{?#{m|r:&#{T:@prev_window_status_left_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -wga @prev_window_status_left_symbol_rendered   "#{"
set-option -wga @prev_window_status_left_symbol_rendered     "s|.*&#{T:@prev_window_status_left_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @prev_window_status_left_symbol_rendered     ":@symbols"
set-option -wga @prev_window_status_left_symbol_rendered   "},"
set-option -wga @prev_window_status_left_symbol_rendered   "#{T:@prev_window_status_left_symbol_resolved}"
set-option -wga @prev_window_status_left_symbol_rendered "}"
set-option -wg  @prev_window_status_right_symbol_rendered "#{?#{m|r:&#{T:@prev_window_status_right_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -wga @prev_window_status_right_symbol_rendered   "#{"
set-option -wga @prev_window_status_right_symbol_rendered     "s|.*&#{T:@prev_window_status_right_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @prev_window_status_right_symbol_rendered     ":@symbols"
set-option -wga @prev_window_status_right_symbol_rendered   "},"
set-option -wga @prev_window_status_right_symbol_rendered   "#{T:@prev_window_status_right_symbol_resolved}"
set-option -wga @prev_window_status_right_symbol_rendered "}"
set-option -wg  @next_window_status_left_symbol_rendered "#{?#{m|r:&#{T:@next_window_status_left_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -wga @next_window_status_left_symbol_rendered   "#{"
set-option -wga @next_window_status_left_symbol_rendered     "s|.*&#{T:@next_window_status_left_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @next_window_status_left_symbol_rendered     ":@symbols"
set-option -wga @next_window_status_left_symbol_rendered   "},"
set-option -wga @next_window_status_left_symbol_rendered   "#{T:@next_window_status_left_symbol_resolved}"
set-option -wga @next_window_status_left_symbol_rendered "}"
set-option -wg  @next_window_status_right_symbol_rendered "#{?#{m|r:&#{T:@next_window_status_right_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -wga @next_window_status_right_symbol_rendered   "#{"
set-option -wga @next_window_status_right_symbol_rendered     "s|.*&#{T:@next_window_status_right_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @next_window_status_right_symbol_rendered     ":@symbols"
set-option -wga @next_window_status_right_symbol_rendered   "},"
set-option -wga @next_window_status_right_symbol_rendered   "#{T:@next_window_status_right_symbol_resolved}"
set-option -wga @next_window_status_right_symbol_rendered "}"
set-option -wg  @window_status_left_symbol  "#{?#{T:@before_active_window},#{T:@prev_window_status_left_symbol_rendered},#{T:@next_window_status_left_symbol_rendered}}"
set-option -wg  @window_status_right_symbol "#{?#{T:@before_active_window},#{T:@prev_window_status_right_symbol_rendered},#{T:@next_window_status_right_symbol_rendered}}"
set-option -wg  @prev_window_status_left_style  "#{?"
set-option -wga @prev_window_status_left_style    "#{&&:"
set-option -wga @prev_window_status_left_style      "#{T:@window_status_bg_computed},"
set-option -wga @prev_window_status_left_style      "#{!=:#{T:@window_status_bg_computed},#{T:@status_bg}}"
set-option -wga @prev_window_status_left_style    "},"
set-option -wga @prev_window_status_left_style    "#[nobold nounderscore noitalics"
set-option -wga @prev_window_status_left_style    " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@window_status_bg_computed}}"
set-option -wga @prev_window_status_left_style    "],"
set-option -wga @prev_window_status_left_style    "#[nobold nounderscore noitalics"
set-option -wga @prev_window_status_left_style    " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{?@window_status_symbol_fg,#{T:@window_status_symbol_fg},#{T:@window_status_fg_computed}}}"
set-option -wga @prev_window_status_left_style    "]"
set-option -wga @prev_window_status_left_style  "}#[push-default]"
set-option -wg  @prev_window_status_right_style "#[default]"
set-option -wg  @next_window_status_left_style  "#{?"
set-option -wga @next_window_status_left_style    "#{&&:"
set-option -wga @next_window_status_left_style      "#{T:@window_status_bg_computed},"
set-option -wga @next_window_status_left_style      "#{!=:#{T:@window_status_bg_computed},#{T:@status_bg}}"
set-option -wga @next_window_status_left_style    "},"
set-option -wga @next_window_status_left_style    "#[nobold nounderscore noitalics"
set-option -wga @next_window_status_left_style    " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@window_status_bg_computed}}"
set-option -wga @next_window_status_left_style    "],"
set-option -wga @next_window_status_left_style    "#[nobold nounderscore noitalics"
set-option -wga @next_window_status_left_style    " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{?@window_status_symbol_fg,#{T:@window_status_symbol_fg},#{T:@window_status_fg_computed}}}"
set-option -wga @next_window_status_left_style    "]"
set-option -wga @next_window_status_left_style  "}#[push-default]"
set-option -wg  @next_window_status_right_style "#[default]"
set-option -wga @window_status_left_style   "#{?#{T:@before_active_window},#{T:@prev_window_status_left_style},#{T:@next_window_status_left_style}}"
set-option -wga @window_status_right_style  "#{?#{T:@before_active_window},#{T:@prev_window_status_right_style},#{T:@next_window_status_right_style}}"
set-option -wg  @window_status_center_style "#["
set-option -wga @window_status_center_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@window_status_fg_computed}}"
set-option -wga @window_status_center_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@window_status_bg_computed}}"
set-option -wga @window_status_center_style "]"
set-option -wg  window-status-format ""
set-option -wga window-status-format "#{T:@window_status_left_style}"
set-option -wga window-status-format "#{T:@window_status_left_symbol}"
set-option -wga window-status-format "#{T:@window_status_center_style}"
set-option -wga window-status-format " "
set-option -wga window-status-format "#{T:@window_index_fwid}."
set-option -wga window-status-format " "
set-option -wga window-status-format "#{s|\n*([^\n]+).*|\\1|r;s|\n*||r:"
set-option -wga window-status-format   "\n#{window_name}"
set-option -wga window-status-format   "\n#{T:@pane_current_path_styled}"
set-option -wga window-status-format "}"
set-option -wga window-status-format "#{T:@window_zoomed_icon}"
set-option -wga window-status-format " "
set-option -wga window-status-format "#{T:@window_status_right_style}"
set-option -wga window-status-format "#{T:@window_status_right_symbol}"
#: }}}
