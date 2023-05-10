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

#: Window separator {{{
set-option -g   @prev_window_separator_symbol_lookup "#{?#{m|r:&#{T:@prev_window_separator_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @prev_window_separator_symbol_lookup   "#{"
set-option -ga  @prev_window_separator_symbol_lookup     "s|.*&#{T:@prev_window_separator_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @prev_window_separator_symbol_lookup     ":@symbols"
set-option -ga  @prev_window_separator_symbol_lookup   "},"
set-option -ga  @prev_window_separator_symbol_lookup   "#{T:@prev_window_separator_symbol}"
set-option -ga  @prev_window_separator_symbol_lookup "}"
set-option -g   @next_window_separator_symbol_lookup "#{?#{m|r:&#{T:@next_window_separator_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @next_window_separator_symbol_lookup   "#{"
set-option -ga  @next_window_separator_symbol_lookup     "s|.*&#{T:@next_window_separator_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @next_window_separator_symbol_lookup     ":@symbols"
set-option -ga  @next_window_separator_symbol_lookup   "},"
set-option -ga  @next_window_separator_symbol_lookup   "#{T:@next_window_separator_symbol}"
set-option -ga  @next_window_separator_symbol_lookup "}"
set-option -g   @window_separator_style "#[nobold nounderscore noitalics"
set-option -ga  @window_separator_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@window_separator_fg}}"
set-option -ga  @window_separator_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@window_separator_bg}}"
set-option -ga  @window_separator_style "]"
set-option -g   @prev_window_separator "#{T:@window_separator_style]#{T:@prev_window_separator_symbol_lookup}"
set-option -g   @next_window_separator "#{T:@window_separator_style]#{T:@next_window_separator_symbol_lookup}"
set-option -g   window-status-separator ""
set-option -gaF window-status-separator "#{?#{T:@before_active_window},#{T:@prev_window_separator},}"
set-option -gaF window-status-separator "#{?#{T:@after_active_window},#{T:@next_window_separator},}"
#: }}}

set-option -g status-interval 1

#: Status left {{{
set-option -g   @status_left_a_content "#{session_name}"
set-option -g   @status_left_b_content ""
set-option -g   @status_left_c_content ""
set-option -g   @status_left_ab_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_a_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_b_bg}} nobold nounderscore noitalics]"
set-option -g   @status_left_Ab_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_A_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_b_bg}} nobold nounderscore noitalics]"
set-option -g   @status_left_bc_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_b_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_c_bg}} nobold nounderscore noitalics]"
set-option -g   @status_left_ac_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_a_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_c_bg}} nobold nounderscore noitalics]"
set-option -g   @status_left_Ac_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_A_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_c_bg}} nobold nounderscore noitalics]"
set-option -g   @status_left_aa_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_a_fg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_a_bg}} bold]"
set-option -g   @status_left_bb_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_b_fg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_b_bg}}]"
set-option -g   @status_left_cc_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_c_fg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_c_bg}}]"
set-option -g   @status_left_AA_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_A_fg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_A_bg}} bold]"
set-option -g   @status_left_ab_symbol_lookup "#{?#{m|r:&#{T:@status_left_ab_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @status_left_ab_symbol_lookup   "#{"
set-option -ga  @status_left_ab_symbol_lookup     "s|.*&#{T:@status_left_ab_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_left_ab_symbol_lookup     ":@symbols"
set-option -ga  @status_left_ab_symbol_lookup   "},"
set-option -ga  @status_left_ab_symbol_lookup   "#{T:@status_left_ab_symbol}"
set-option -ga  @status_left_ab_symbol_lookup "}"
set-option -g   @status_left_bc_symbol_lookup "#{?#{m|r:&#{T:@status_left_bc_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @status_left_bc_symbol_lookup   "#{"
set-option -ga  @status_left_bc_symbol_lookup     "s|.*&#{T:@status_left_bc_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_left_bc_symbol_lookup     ":@symbols"
set-option -ga  @status_left_bc_symbol_lookup   "},"
set-option -ga  @status_left_bc_symbol_lookup   "#{T:@status_left_bc_symbol}"
set-option -ga  @status_left_bc_symbol_lookup "}"
set-option -g   @status_left_cc_symbol_lookup "#{?#{m|r:&#{T:@status_left_cc_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @status_left_cc_symbol_lookup   "#{"
set-option -ga  @status_left_cc_symbol_lookup     "s|.*&#{T:@status_left_cc_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_left_cc_symbol_lookup     ":@symbols"
set-option -ga  @status_left_cc_symbol_lookup   "},"
set-option -ga  @status_left_cc_symbol_lookup   "#{T:@status_left_cc_symbol}"
set-option -ga  @status_left_cc_symbol_lookup "}"
set-option -g   @status_left_a_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_left_a_content}}"
set-option -g   @status_left_b_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_left_b_content}}"
set-option -g   @status_left_c_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_left_c_content}}"
set-option -g   status-left ""
set-option -ga  status-left "#{?client_prefix,"
set-option -ga  status-left   "#{T:@status_left_AA_style}"
set-option -ga  status-left   "#{T:@status_left_a_content_padded}"
set-option -ga  status-left   "#{T:@status_left_Ab_style}"
set-option -ga  status-left   "#{T:@status_left_ab_symbol_lookup}"
set-option -ga  status-left   ","
set-option -ga  status-left   "#{T:@status_left_aa_style}"
set-option -ga  status-left   "#{T:@status_left_a_content_padded}"
set-option -ga  status-left   "#{T:@status_left_ab_style}"
set-option -ga  status-left   "#{T:@status_left_ab_symbol_lookup}"
set-option -ga  status-left "}"
set-option -ga  status-left "#{T:@status_left_bb_style}"
set-option -ga  status-left "#{T:@status_left_bb_style}"
set-option -ga  status-left "#{T:@status_left_b_content_padded}"
set-option -ga  status-left "#{T:@status_left_bc_style}"
set-option -ga  status-left "#{T:@status_left_bc_symbol_lookup}"
set-option -ga  status-left "#{T:@status_left_cc_style}"
set-option -ga  status-left "#{T:@status_left_c_content_padded}"
#: }}}

#: Status right {{{
set-option -g   @status_right_x_content "%a, %b %d"
set-option -g   @status_right_y_content ""
set-option -g   @status_right_z_content "%-l:%M"
set-option -g   @status_right_xy_style "#[nobold nounderscore noitalics"
set-option -ga  @status_right_xy_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_right_y_bg}}"
set-option -ga  @status_right_xy_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_right_x_bg}}"
set-option -ga  @status_right_xy_style "]"
set-option -g   @status_right_yz_style "#[nobold nounderscore noitalics"
set-option -ga  @status_right_yz_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_right_z_bg}}"
set-option -ga  @status_right_yz_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_right_y_bg}}"
set-option -ga  @status_right_yz_style "]"
set-option -g   @status_right_yZ_style "#[nobold nounderscore noitalics"
set-option -ga  @status_right_yZ_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_right_Z_bg}}"
set-option -ga  @status_right_yZ_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_right_y_bg}}"
set-option -ga  @status_right_yZ_style "]"
set-option -g   @status_right_xz_style "#[nobold nounderscore noitalics"
set-option -ga  @status_right_xz_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_right_z_bg}}"
set-option -ga  @status_right_xz_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_right_x_bg}}"
set-option -ga  @status_right_xz_style "]"
set-option -g   @status_right_xZ_style "#[nobold nounderscore noitalics"
set-option -ga  @status_right_xZ_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_right_Z_bg}}"
set-option -ga  @status_right_xZ_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_right_x_bg}}"
set-option -ga  @status_right_xZ_style "]"
set-option -g   @status_right_xx_style "#["
set-option -ga  @status_right_xx_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_right_x_fg}}"
set-option -ga  @status_right_xx_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_right_x_bg}}"
set-option -ga  @status_right_xx_style "]"
set-option -g   @status_right_yy_style "#["
set-option -ga  @status_right_yy_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_right_y_fg}}"
set-option -ga  @status_right_yy_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_right_y_bg}}"
set-option -ga  @status_right_yy_style "]"
set-option -g   @status_right_zz_style "#[bold"
set-option -ga  @status_right_zz_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_right_z_fg}}"
set-option -ga  @status_right_zz_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_right_z_bg}}"
set-option -ga  @status_right_zz_style "]"
set-option -g   @status_right_ZZ_style "#[bold"
set-option -ga  @status_right_ZZ_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_right_Z_fg}}"
set-option -ga  @status_right_ZZ_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_right_Z_bg}}"
set-option -ga  @status_right_ZZ_style "]"
set-option -g   @status_right_xx_symbol_lookup "#{?#{m|r:&#{T:@status_right_xx_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @status_right_xx_symbol_lookup   "#{"
set-option -ga  @status_right_xx_symbol_lookup     "s|.*&#{T:@status_right_xx_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_right_xx_symbol_lookup     ":@symbols"
set-option -ga  @status_right_xx_symbol_lookup   "},"
set-option -ga  @status_right_xx_symbol_lookup   "#{T:@status_right_xx_symbol}"
set-option -ga  @status_right_xx_symbol_lookup "}"
set-option -g   @status_right_xy_symbol_lookup "#{?#{m|r:&#{T:@status_right_xy_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @status_right_xy_symbol_lookup   "#{"
set-option -ga  @status_right_xy_symbol_lookup     "s|.*&#{T:@status_right_xy_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_right_xy_symbol_lookup     ":@symbols"
set-option -ga  @status_right_xy_symbol_lookup   "},"
set-option -ga  @status_right_xy_symbol_lookup   "#{T:@status_right_xy_symbol}"
set-option -ga  @status_right_xy_symbol_lookup "}"
set-option -g   @status_right_yz_symbol_lookup "#{?#{m|r:&#{T:@status_right_yz_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @status_right_yz_symbol_lookup   "#{"
set-option -ga  @status_right_yz_symbol_lookup     "s|.*&#{T:@status_right_yz_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_right_yz_symbol_lookup     ":@symbols"
set-option -ga  @status_right_yz_symbol_lookup   "},"
set-option -ga  @status_right_yz_symbol_lookup   "#{T:@status_right_yz_symbol}"
set-option -ga  @status_right_yz_symbol_lookup "}"
set-option -g   @status_right_x_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_right_x_content}}"
set-option -g   @status_right_y_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_right_y_content}}"
set-option -g   @status_right_z_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_right_z_content}}"
set-option -g   status-right ""
set-option -ga  status-right "#{T:@status_right_xx_style}"
set-option -ga  status-right "#{T:@status_right_x_content_padded}"
set-option -ga  status-right "#{T:@status_right_xy_style}"
set-option -ga  status-right "#{T:@status_right_xy_symbol_lookup}"
set-option -ga  status-right "#{T:@status_right_yy_style}"
set-option -ga  status-right "#{T:@status_right_y_content_padded}"
set-option -ga  status-right "#{T:@status_right_yz_style}"
set-option -ga  status-right "#{T:@status_right_yz_symbol_lookup}"
set-option -ga  status-right "#{T:@status_right_zz_style}"
set-option -ga  status-right "#{T:@status_right_z_content_padded}"
#: }}}

#: Window status {{{
set-option -wg  @window_status_fg_computed "#{?window_marked_flag,"
set-option -wga @window_status_fg_computed   "#{T:@marked_window_status_fg},"
set-option -wga @window_status_fg_computed   "#{T:@window_status_fg}"
set-option -wga @window_status_fg_computed "}"
set-option -wg  @window_status_bg_computed "#{?window_marked_flag,"
set-option -wga @window_status_bg_computed   "#{T:@marked_window_status_bg},"
set-option -wga @window_status_bg_computed   "#{T:@window_status_bg}"
set-option -wga @window_status_bg_computed "}"
set-option -wg  @prev_window_status_left_symbol_lookup  "#{?#{m|r:&#{T:@prev_window_status_left_symbol}\s*=,#{T:@symbols}},"
set-option -wga @prev_window_status_left_symbol_lookup    "#{"
set-option -wga @prev_window_status_left_symbol_lookup      "s|.*&#{T:@prev_window_status_left_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @prev_window_status_left_symbol_lookup      ":@symbols"
set-option -wga @prev_window_status_left_symbol_lookup    "},"
set-option -wga @prev_window_status_left_symbol_lookup    "#{T:@prev_window_status_left_symbol}"
set-option -wga @prev_window_status_left_symbol_lookup  "}"
set-option -wg  @prev_window_status_right_symbol_lookup "#{?#{m|r:&#{T:@prev_window_status_right_symbol}\s*=,#{T:@symbols}},"
set-option -wga @prev_window_status_right_symbol_lookup   "#{"
set-option -wga @prev_window_status_right_symbol_lookup     "s|.*&#{T:@prev_window_status_right_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @prev_window_status_right_symbol_lookup     ":@symbols"
set-option -wga @prev_window_status_right_symbol_lookup   "},"
set-option -wga @prev_window_status_right_symbol_lookup   "#{T:@prev_window_status_right_symbol}"
set-option -wga @prev_window_status_right_symbol_lookup "}"
set-option -wg  @next_window_status_left_symbol_lookup  "#{?#{m|r:&#{T:@next_window_status_left_symbol}\s*=,#{T:@symbols}},"
set-option -wga @next_window_status_left_symbol_lookup    "#{"
set-option -wga @next_window_status_left_symbol_lookup      "s|.*&#{T:@next_window_status_left_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @next_window_status_left_symbol_lookup      ":@symbols"
set-option -wga @next_window_status_left_symbol_lookup    "},"
set-option -wga @next_window_status_left_symbol_lookup    "#{T:@next_window_status_left_symbol}"
set-option -wga @next_window_status_left_symbol_lookup  "}"
set-option -wg  @next_window_status_right_symbol_lookup "#{?#{m|r:&#{T:@next_window_status_right_symbol}\s*=,#{T:@symbols}},"
set-option -wga @next_window_status_right_symbol_lookup   "#{"
set-option -wga @next_window_status_right_symbol_lookup     "s|.*&#{T:@next_window_status_right_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @next_window_status_right_symbol_lookup     ":@symbols"
set-option -wga @next_window_status_right_symbol_lookup   "},"
set-option -wga @next_window_status_right_symbol_lookup   "#{T:@next_window_status_right_symbol}"
set-option -wga @next_window_status_right_symbol_lookup "}"
set-option -wg  @window_status_left_symbol  "#{?#{T:@before_active_window},#{T:@prev_window_status_left_symbol_lookup},#{T:@next_window_status_left_symbol_lookup}}"
set-option -wg  @window_status_right_symbol "#{?#{T:@before_active_window},#{T:@prev_window_status_right_symbol_lookup},#{T:@next_window_status_right_symbol_lookup}}"
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
set-option -wg  @window_status_center_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@window_status_fg_computed}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@window_status_bg_computed}}]"
set-option -wg  window-status-format ""
set-option -wga window-status-format "#{T:@window_status_left_style}"
set-option -wga window-status-format "#{T:@window_status_left_symbol}"
set-option -wga window-status-format "#{T:@window_status_center_style}"
set-option -wga window-status-format " "
set-option -wga window-status-format "#{T:@window_index_fwid}."
set-option -wga window-status-format " "
set-option -wga window-status-format "#{?window_name,"
set-option -wga window-status-format   "#{window_name},"
set-option -wga window-status-format   "#{?@pane_title,"
set-option -wga window-status-format     "#{T:@pane_title},"
set-option -wga window-status-format     "#{T:@pane_current_path_styled}"
set-option -wga window-status-format   "}"
set-option -wga window-status-format "}"
set-option -wga window-status-format "#{T:@window_zoomed_icon}"
set-option -wga window-status-format " "
set-option -wga window-status-format "#{T:@window_status_right_style}"
set-option -wga window-status-format "#{T:@window_status_right_symbol}"
#: }}}

#: Window status current {{{
set-option -wg  @active_window_status_fg_computed "#{?window_marked_flag,"
set-option -wga @active_window_status_fg_computed   "#{?@marked_active_window_status_fg,"
set-option -wga @active_window_status_fg_computed     "#{T:@marked_active_window_status_fg},"
set-option -wga @active_window_status_fg_computed     "#{?@marked_window_status_fg,"
set-option -wga @active_window_status_fg_computed       "#{T:@marked_window_status_fg},"
set-option -wga @active_window_status_fg_computed       "#{?@active_window_status_fg,"
set-option -wga @active_window_status_fg_computed         "#{T:@active_window_status_fg},"
set-option -wga @active_window_status_fg_computed         "#{T:@window_status_fg}"
set-option -wga @active_window_status_fg_computed       "}"
set-option -wga @active_window_status_fg_computed     "}"
set-option -wga @active_window_status_fg_computed   "},"
set-option -wga @active_window_status_fg_computed   "#{?@active_window_status_fg,"
set-option -wga @active_window_status_fg_computed     "#{T:@active_window_status_fg},"
set-option -wga @active_window_status_fg_computed     "#{T:@window_status_fg}"
set-option -wga @active_window_status_fg_computed   "}"
set-option -wga @active_window_status_fg_computed "}"
set-option -wg  @active_window_status_bg_computed "#{?window_marked_flag,"
set-option -wga @active_window_status_bg_computed   "#{?@marked_active_window_status_bg,"
set-option -wga @active_window_status_bg_computed     "#{T:@marked_active_window_status_bg},"
set-option -wga @active_window_status_bg_computed     "#{?@marked_window_status_bg,"
set-option -wga @active_window_status_bg_computed       "#{T:@marked_window_status_bg},"
set-option -wga @active_window_status_bg_computed       "#{?@active_window_status_bg,"
set-option -wga @active_window_status_bg_computed         "#{T:@active_window_status_bg},"
set-option -wga @active_window_status_bg_computed         "#{T:@window_status_bg}"
set-option -wga @active_window_status_bg_computed       "}"
set-option -wga @active_window_status_bg_computed     "}"
set-option -wga @active_window_status_bg_computed   "},"
set-option -wga @active_window_status_bg_computed   "#{?@active_window_status_bg,"
set-option -wga @active_window_status_bg_computed     "#{T:@active_window_status_bg},"
set-option -wga @active_window_status_bg_computed     "#{T:@window_status_bg}"
set-option -wga @active_window_status_bg_computed   "}"
set-option -wga @active_window_status_bg_computed "}"
set-option -wg  @active_window_status_left_symbol_lookup  "#{?#{m|r:&#{T:@active_window_status_left_symbol}\s*=,#{T:@symbols}},"
set-option -wga @active_window_status_left_symbol_lookup    "#{"
set-option -wga @active_window_status_left_symbol_lookup      "s|.*&#{T:@active_window_status_left_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @active_window_status_left_symbol_lookup      ":@symbols"
set-option -wga @active_window_status_left_symbol_lookup    "},"
set-option -wga @active_window_status_left_symbol_lookup    "#{T:@active_window_status_left_symbol}"
set-option -wga @active_window_status_left_symbol_lookup  "}"
set-option -wg  @active_window_status_right_symbol_lookup "#{?#{m|r:&#{T:@active_window_status_right_symbol}\s*=,#{T:@symbols}},"
set-option -wga @active_window_status_right_symbol_lookup   "#{"
set-option -wga @active_window_status_right_symbol_lookup     "s|.*&#{T:@active_window_status_right_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -wga @active_window_status_right_symbol_lookup     ":@symbols"
set-option -wga @active_window_status_right_symbol_lookup   "},"
set-option -wga @active_window_status_right_symbol_lookup   "#{T:@active_window_status_right_symbol}"
set-option -wga @active_window_status_right_symbol_lookup "}"
set-option -wg  @active_window_status_left_style   "#{?"
set-option -wga @active_window_status_left_style     "#{&&:"
set-option -wga @active_window_status_left_style       "#{T:@active_window_status_bg_computed},"
set-option -wga @active_window_status_left_style       "#{!=:#{T:@active_window_status_bg_computed},#{T:@status_bg}}"
set-option -wga @active_window_status_left_style     "},"
set-option -wga @active_window_status_left_style     "#[nobold nounderscore noitalics"
set-option -wga @active_window_status_left_style     " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@active_window_status_bg_computed}}"
set-option -wga @active_window_status_left_style     "],"
set-option -wga @active_window_status_left_style     "#[nobold nounderscore noitalics"
set-option -wga @active_window_status_left_style     " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{?@active_window_status_symbol_fg,#{T:@active_window_status_symbol_fg},#{T:@active_window_status_fg_computed}}}"
set-option -wga @active_window_status_left_style     "]"
set-option -wga @active_window_status_left_style   "}#[push-default]"
set-option -wg  @active_window_status_right_style  "#[default]"
set-option -wg  @active_window_status_center_style "#["
set-option -wga @active_window_status_center_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@active_window_status_fg_computed}}"
set-option -wga @active_window_status_center_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@active_window_status_bg_computed}}"
set-option -wga @active_window_status_center_style "]"
set-option -wg  window-status-current-format ""
set-option -wga window-status-current-format "#{T:@active_window_status_left_style}"
set-option -wga window-status-current-format "#{T:@active_window_status_left_symbol_lookup}"
set-option -wga window-status-current-format "#{T:@active_window_status_center_style}"
set-option -wga window-status-current-format " "
set-option -wga window-status-current-format "#{T:@window_index_fwid}."
set-option -wga window-status-current-format " "
set-option -wga window-status-current-format "#{?window_name,"
set-option -wga window-status-current-format   "#{window_name},"
set-option -wga window-status-current-format   "#{?@pane_title,"
set-option -wga window-status-current-format     "#{T:@pane_title},"
set-option -wga window-status-current-format     "#{T:@pane_current_path_styled}"
set-option -wga window-status-current-format   "}"
set-option -wga window-status-current-format "}"
set-option -wga window-status-current-format "#{T:@window_zoomed_icon}"
set-option -wga window-status-current-format " "
set-option -wga window-status-current-format "#{T:@active_window_status_right_style}"
set-option -wga window-status-current-format "#{T:@active_window_status_right_symbol_lookup}"
#: }}}

#: Pane border {{{
set-option -g   @pane_status_left_symbol_lookup  "#{?#{m|r:&#{T:@pane_status_left_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @pane_status_left_symbol_lookup    "#{"
set-option -ga  @pane_status_left_symbol_lookup      "s|.*&#{T:@pane_status_left_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @pane_status_left_symbol_lookup      ":@symbols"
set-option -ga  @pane_status_left_symbol_lookup    "},"
set-option -ga  @pane_status_left_symbol_lookup    "#{T:@pane_status_left_symbol}"
set-option -ga  @pane_status_left_symbol_lookup  "}"
set-option -g   @pane_status_right_symbol_lookup "#{?#{m|r:&#{T:@pane_status_right_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @pane_status_right_symbol_lookup   "#{"
set-option -ga  @pane_status_right_symbol_lookup     "s|.*&#{T:@pane_status_right_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @pane_status_right_symbol_lookup     ":@symbols"
set-option -ga  @pane_status_right_symbol_lookup   "},"
set-option -ga  @pane_status_right_symbol_lookup   "#{T:@pane_status_right_symbol}"
set-option -ga  @pane_status_right_symbol_lookup "}"
set-option -g   @active_pane_status_left_symbol_lookup  "#{?#{m|r:&#{T:@active_pane_status_left_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @active_pane_status_left_symbol_lookup    "#{"
set-option -ga  @active_pane_status_left_symbol_lookup      "s|.*&#{T:@active_pane_status_left_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @active_pane_status_left_symbol_lookup      ":@symbols"
set-option -ga  @active_pane_status_left_symbol_lookup    "},"
set-option -ga  @active_pane_status_left_symbol_lookup    "#{T:@active_pane_status_left_symbol}"
set-option -ga  @active_pane_status_left_symbol_lookup  "}"
set-option -g   @active_pane_status_right_symbol_lookup "#{?#{m|r:&#{T:@active_pane_status_right_symbol}\s*=,#{T:@symbols}},"
set-option -ga  @active_pane_status_right_symbol_lookup   "#{"
set-option -ga  @active_pane_status_right_symbol_lookup     "s|.*&#{T:@active_pane_status_right_symbol}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @active_pane_status_right_symbol_lookup     ":@symbols"
set-option -ga  @active_pane_status_right_symbol_lookup   "},"
set-option -ga  @active_pane_status_right_symbol_lookup   "#{T:@active_pane_status_right_symbol}"
set-option -ga  @active_pane_status_right_symbol_lookup "}"
set-option -g   @pane_status_left_style   "#[nobold nounderscore noitalics"
set-option -ga  @pane_status_left_style   " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@pane_status_bg}}"
set-option -ga  @pane_status_left_style   "]#[push-default]"
set-option -g   @pane_status_right_style  "#[default]"
set-option -g   @pane_status_center_style "#["
set-option -ga  @pane_status_center_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@pane_status_fg}}"
set-option -ga  @pane_status_center_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@pane_status_bg}}"
set-option -ga  @pane_status_center_style "]"
set-option -g   @active_pane_status_left_style   "#[nobold nounderscore noitalics"
set-option -ga  @active_pane_status_left_style   " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@active_pane_status_bg}}"
set-option -ga  @active_pane_status_left_style   "]"
set-option -g   @active_pane_status_right_style  "#[default]"
set-option -g   @active_pane_status_center_style "#["
set-option -ga  @active_pane_status_center_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@active_pane_status_fg}}"
set-option -ga  @active_pane_status_center_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@active_pane_status_bg}}"
set-option -ga  @active_pane_status_center_style "]"
set-option -g   @pane_status_content " "
set-option -ga  @pane_status_content "#{?@pane_title,"
set-option -ga  @pane_status_content   "＄ #{T:@pane_title},"
set-option -ga  @pane_status_content   "  #{T:@pane_current_path_styled}"
set-option -ga  @pane_status_content "}"
set-option -ga  @pane_status_content "#{T:@window_zoomed_icon}"
set-option -ga  @pane_status_content " "
set-option -g  pane-border-format ""
set-option -ga pane-border-format "#{?pane_active,"
set-option -ga pane-border-format   "#{T:@active_pane_status_left_style}"
set-option -ga pane-border-format   "#{T:@active_pane_status_left_symbol_lookup}"
set-option -ga pane-border-format   "#{T:@active_pane_status_center_style}"
set-option -ga pane-border-format   "#{T:@pane_status_content}"
set-option -ga pane-border-format   "#{T:@active_pane_status_right_style}"
set-option -ga pane-border-format   "#{T:@active_pane_status_right_symbol_lookup}"
set-option -ga pane-border-format   ","
set-option -ga pane-border-format   "#{T:@pane_status_left_style}"
set-option -ga pane-border-format   "#{T:@pane_status_left_symbol_lookup}"
set-option -ga pane-border-format   "#{T:@pane_status_center_style}"
set-option -ga pane-border-format   "#{T:@pane_status_content}"
set-option -ga pane-border-format   "#{T:@pane_status_right_style}"
set-option -ga pane-border-format   "#{T:@pane_status_right_symbol_lookup}"
set-option -ga pane-border-format "}"
#: }}}
