set-option -g   @search_match_fg              "#{?@user_search_match_fg,#{E:@user_search_match_fg},#{E:@theme_search_match_fg}}"
set-option -g   @search_match_bg              "#{?@user_search_match_bg,#{E:@user_search_match_bg},#{E:@theme_search_match_bg}}"
set-option -g   @search_current_match_fg      "#{?@user_search_current_match_fg,#{E:@user_search_current_match_fg},#{E:@theme_search_current_match_fg}}"
set-option -g   @search_current_match_bg      "#{?@user_search_current_match_bg,#{E:@user_search_current_match_bg},#{E:@theme_search_current_match_bg}}"
set-option -g   @selection_fg                 "#{?@user_selection_fg,#{E:@user_selection_fg},#{E:@theme_selection_fg}}"
set-option -g   @selection_bg                 "#{?@user_selection_bg,#{E:@user_selection_bg},#{E:@theme_selection_bg}}"
set-option -g   @message_fg                   "#{?@user_message_fg,#{E:@user_message_fg},#{E:@theme_message_fg}}"
set-option -g   @message_bg                   "#{?@user_message_bg,#{E:@user_message_bg},#{E:@theme_message_bg}}"
set-option -g   @message_command_fg           "#{?@user_message_command_fg,#{E:@user_message_command_fg},#{E:@theme_message_command_fg}}"
set-option -g   @message_command_bg           "#{?@user_message_command_bg,#{E:@user_message_command_bg},#{E:@theme_message_command_bg}}"
set-option -g   @pane_border_fg               "#{?@user_pane_border_fg,#{E:@user_pane_border_fg},#{E:@theme_pane_border_fg}}"
set-option -g   @pane_border_bg               "#{?@user_pane_border_bg,#{E:@user_pane_border_bg},#{E:@theme_pane_border_bg}}"
set-option -g   @pane_active_border_fg        "#{?@user_pane_active_border_fg,#{E:@user_pane_active_border_fg},#{E:@theme_pane_active_border_fg}}"
set-option -g   @pane_active_border_bg        "#{?@user_pane_active_border_bg,#{E:@user_pane_active_border_bg},#{E:@theme_pane_active_border_bg}}"

set-option -g   mode-style                    ""
set-option -ga  mode-style                    "#{s|.+|fg=\\0|:#{E:@selection_fg}}"
set-option -ga  mode-style                    "#{s|.+|bg=\\0|:#{E:@selection_bg}}"
set-option -g   copy-mode-match-style         ""
set-option -ga  copy-mode-match-style         "#{s|.+|fg=\\0|:#{E:@search_match_fg}}"
set-option -ga  copy-mode-match-style         "#{s|.+|bg=\\0|:#{E:@search_match_bg}}"
set-option -g   copy-mode-current-match-style ""
set-option -ga  copy-mode-current-match-style "#{s|.+|fg=\\0|:#{E:@search_current_match_fg}}"
set-option -ga  copy-mode-current-match-style "#{s|.+|bg=\\0|:#{E:@search_current_match_bg}}"
set-option -g   message-style                 ""
set-option -ga  message-style                 "#{s|.+|fg=\\0|:#{E:@message_fg}}"
set-option -ga  message-style                 "#{s|.+|bg=\\0|:#{E:@message_bg}}"
set-option -g   message-command-style         ""
set-option -ga  message-command-style         "#{s|.+|fg=\\0|:#{E:@message_command_fg}}"
set-option -ga  message-command-style         "#{s|.+|bg=\\0|:#{E:@message_command_bg}}"
set-option -g   pane-border-style             ""
set-option -ga  pane-border-style             "#{s|.+|fg=\\0|:#{E:@pane_border_fg}}"
set-option -ga  pane-border-style             "#{s|.+|bg=\\0|:#{E:@pane_border_bg}}"
set-option -g   pane-active-border-style      ""
set-option -ga  pane-active-border-style      "#{s|.+|fg=\\0|:#{E:@pane_active_border_fg}}"
set-option -ga  pane-active-border-style      "#{s|.+|bg=\\0|:#{E:@pane_active_border_bg}}"

#: Status line {{{
#: Variables {{{
set-option -g   @symbol_ab             "#{s|.* #{?@user_symbol_ab,#{E:@user_symbol_ab},#{E:@theme_symbol_ab}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_bc             "#{s|.* #{?@user_symbol_bc,#{E:@user_symbol_bc},#{E:@theme_symbol_bc}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_cc             "#{s|.* #{?@user_symbol_cc,#{E:@user_symbol_cc},#{E:@theme_symbol_cc}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_xy             "#{s|.* #{?@user_symbol_xy,#{E:@user_symbol_xy},#{E:@theme_symbol_xy}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_yz             "#{s|.* #{?@user_symbol_yz,#{E:@user_symbol_yz},#{E:@theme_symbol_yz}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_xx             "#{s|.* #{?@user_symbol_xx,#{E:@user_symbol_xx},#{E:@theme_symbol_xx}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_cwin_left      "#{s|.* #{?@user_symbol_cwin_left,#{E:@user_symbol_cwin_left},#{E:@theme_symbol_cwin_left}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_cwin_right     "#{s|.* #{?@user_symbol_cwin_right,#{E:@user_symbol_cwin_right},#{E:@theme_symbol_cwin_right}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_win_left       "#{s|.* #{?@user_symbol_win_left,#{E:@user_symbol_win_left},#{E:@theme_symbol_win_left}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_win_right      "#{s|.* #{?@user_symbol_win_right,#{E:@user_symbol_win_right},#{E:@theme_symbol_win_right}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_apane_left     "#{s|.* #{?@user_symbol_apane_left,#{E:@user_symbol_apane_left},#{E:@theme_symbol_apane_left}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_apane_right    "#{s|.* #{?@user_symbol_apane_right,#{E:@user_symbol_apane_right},#{E:@theme_symbol_apane_right}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_pane_left      "#{s|.* #{?@user_symbol_pane_left,#{E:@user_symbol_pane_left},#{E:@theme_symbol_pane_left}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @symbol_pane_right     "#{s|.* #{?@user_symbol_pane_right,#{E:@user_symbol_pane_right},#{E:@theme_symbol_pane_right}} +([^ ]+) .*|\\1|r:#{E:@symbols}}"
set-option -g   @fg                    "#{?@user_fg,#{E:@user_fg},#{E:@theme_fg}}"
set-option -g   @bg                    "#{?@user_bg,#{E:@user_bg},#{E:@theme_bg}}"
set-option -g   @fg_a                  "#{?@user_fg_a,#{E:@user_fg_a},#{E:@theme_fg_a}}"
set-option -g   @bg_a                  "#{?@user_bg_a,#{E:@user_bg_a},#{E:@theme_bg_a}}"
set-option -g   @fg_A                  "#{?@user_fg_A,#{E:@user_fg_A},#{E:@theme_fg_A}}"
set-option -g   @bg_A                  "#{?@user_bg_A,#{E:@user_bg_A},#{E:@theme_bg_A}}"
set-option -g   @fg_b                  "#{?@user_fg_b,#{E:@user_fg_b},#{E:@theme_fg_b}}"
set-option -g   @bg_b                  "#{?@user_bg_b,#{E:@user_bg_b},#{E:@theme_bg_b}}"
set-option -g   @fg_c                  "#{?@user_fg_c,#{E:@user_fg_c},#{E:@theme_fg_c}}"
set-option -g   @bg_c                  "#{?@user_bg_c,#{E:@user_bg_c},#{E:@theme_bg_c}}"
set-option -g   @fg_x                  "#{?@user_fg_x,#{E:@user_fg_x},#{E:@theme_fg_x}}"
set-option -g   @bg_x                  "#{?@user_bg_x,#{E:@user_bg_x},#{E:@theme_bg_x}}"
set-option -g   @fg_y                  "#{?@user_fg_y,#{E:@user_fg_y},#{E:@theme_fg_y}}"
set-option -g   @bg_y                  "#{?@user_bg_y,#{E:@user_bg_y},#{E:@theme_bg_y}}"
set-option -g   @fg_z                  "#{?@user_fg_z,#{E:@user_fg_z},#{E:@theme_fg_z}}"
set-option -g   @bg_z                  "#{?@user_bg_z,#{E:@user_bg_z},#{E:@theme_bg_z}}"
set-option -g   @fg_Z                  "#{?@user_fg_Z,#{E:@user_fg_Z},#{E:@theme_fg_Z}}"
set-option -g   @bg_Z                  "#{?@user_bg_Z,#{E:@user_bg_Z},#{E:@theme_bg_Z}}"
set-option -g   @fg_win                "#{?@user_fg_win,#{E:@user_fg_win},#{E:@theme_fg_win}}"
set-option -g   @bg_win                "#{?@user_bg_win,#{E:@user_bg_win},#{E:@theme_bg_win}}"
set-option -g   @fg_win_alt            "#{?@user_fg_win_alt,#{E:@user_fg_win_alt},#{E:@theme_fg_win_alt}}"
set-option -g   @bg_win_alt            "#{?@user_bg_win_alt,#{E:@user_bg_win_alt},#{E:@theme_bg_win_alt}}"
set-option -g   @fg_cwin               "#{?@user_fg_cwin,#{E:@user_fg_cwin},#{E:@theme_fg_cwin}}"
set-option -g   @bg_cwin               "#{?@user_bg_cwin,#{E:@user_bg_cwin},#{E:@theme_bg_cwin}}"
set-option -g   @fg_cwin_alt           "#{?@user_fg_cwin_alt,#{E:@user_fg_cwin_alt},#{E:@theme_fg_cwin_alt}}"
set-option -g   @bg_cwin_alt           "#{?@user_bg_cwin_alt,#{E:@user_bg_cwin_alt},#{E:@theme_bg_cwin_alt}}"
set-option -g   @fg_pane               "#{?@user_fg_pane,#{E:@user_fg_pane},#{E:@theme_fg_pane}}"
set-option -g   @bg_pane               "#{?@user_bg_pane,#{E:@user_bg_pane},#{E:@theme_bg_pane}}"
set-option -g   @fg_apane              "#{?@user_fg_apane,#{E:@user_fg_apane},#{E:@theme_fg_apane}}"
set-option -g   @bg_apane              "#{?@user_bg_apane,#{E:@user_bg_apane},#{E:@theme_bg_apane}}"
#: }}}
#: Contents {{{
set-option -g   @content_a_default  "#{session_name}"
set-option -g   @content_b_default  ""
set-option -g   @content_c_default  ""
set-option -g   @content_x_default  "%a, %b %d"
set-option -g   @content_y_default  ""
set-option -g   @content_z_default  "%-l:%M"
set-option -g   @content_a          "#{s|^.+$| \\0 |:#{?@user_content_a,#{E:@user_content_a},#{E:@content_a_default}}}"
set-option -g   @content_b          "#{s|^.+$| \\0 |:#{?@user_content_b,#{E:@user_content_b},#{E:@content_b_default}}}"
set-option -g   @content_c          "#{s|^.+$| \\0 |:#{?@user_content_c,#{E:@user_content_c},#{E:@content_c_default}}}"
set-option -g   @content_x          "#{s|^.+$| \\0 |:#{?@user_content_x,#{E:@user_content_x},#{E:@content_x_default}}}"
set-option -g   @content_y          "#{s|^.+$| \\0 |:#{?@user_content_y,#{E:@user_content_y},#{E:@content_y_default}}}"
set-option -g   @content_z          "#{s|^.+$| \\0 |:#{?@user_content_z,#{E:@user_content_z},#{E:@content_z_default}}}"
#: }}}
#: Formats {{{
set-option -g   @format_ab              "#[fg=#{E:@bg_a},bg=#{E:@bg_b},nobold,nounderscore,noitalics]"
set-option -g   @format_Ab              "#[fg=#{E:@bg_A},bg=#{E:@bg_b},nobold,nounderscore,noitalics]"
set-option -g   @format_bc              "#[fg=#{E:@bg_b},bg=#{E:@bg_c},nobold,nounderscore,noitalics]"
set-option -g   @format_ac              "#[fg=#{E:@bg_a},bg=#{E:@bg_c},nobold,nounderscore,noitalics]"
set-option -g   @format_Ac              "#[fg=#{E:@bg_A},bg=#{E:@bg_c},nobold,nounderscore,noitalics]"
set-option -g   @format_aa              "#[fg=#{E:@fg_a},bg=#{E:@bg_a},bold]"
set-option -g   @format_bb              "#[fg=#{E:@fg_b},bg=#{E:@bg_b}]"
set-option -g   @format_cc              "#[fg=#{E:@fg_c},bg=#{E:@bg_c}]"
set-option -g   @format_AA              "#[fg=#{E:@fg_A},bg=#{E:@bg_A},bold]"
set-option -g   @format_xy              "#[fg=#{E:@bg_y},bg=#{E:@bg_x},nobold,nounderscore,noitalics]"
set-option -g   @format_yz              "#[fg=#{E:@bg_z},bg=#{E:@bg_y},nobold,nounderscore,noitalics]"
set-option -g   @format_yZ              "#[fg=#{E:@bg_Z},bg=#{E:@bg_y},nobold,nounderscore,noitalics]"
set-option -g   @format_xz              "#[fg=#{E:@bg_z},bg=#{E:@bg_x},nobold,nounderscore,noitalics]"
set-option -g   @format_xZ              "#[fg=#{E:@bg_Z},bg=#{E:@bg_x},nobold,nounderscore,noitalics]"
set-option -g   @format_xx              "#[fg=#{E:@fg_x},bg=#{E:@bg_x}]"
set-option -g   @format_yy              "#[fg=#{E:@fg_y},bg=#{E:@bg_y}]"
set-option -g   @format_zz              "#[fg=#{E:@fg_z},bg=#{E:@bg_z},bold]"
set-option -g   @format_ZZ              "#[fg=#{E:@fg_Z},bg=#{E:@bg_Z},bold]"
set-option -g   @format_win_left        "#[fg=#{E:@bg_win},nobold,nounderscore,noitalics]#[push-default]"
set-option -g   @format_win_right       "#[default]"
set-option -g   @format_win_center      "#[fg=#{E:@fg_win},bg=#{E:@bg_win}]"
set-option -g   @format_win_left_alt    "#[fg=#{E:@bg_win_alt},nobold,nounderscore,noitalics]#[push-default]"
set-option -g   @format_win_right_alt   "#[default]"
set-option -g   @format_win_center_alt  "#[fg=#{E:@fg_win_alt},bg=#{E:@bg_win_alt}]"
set-option -g   @format_cwin_left       "#[fg=#{E:@bg_cwin},nobold,nounderscore,noitalics]#[push-default]"
set-option -g   @format_cwin_right      "#[default]"
set-option -g   @format_cwin_center     "#[fg=#{E:@fg_cwin},bg=#{E:@bg_cwin}]"
set-option -g   @format_cwin_left_alt   "#[fg=#{E:@bg_cwin_alt},nobold,nounderscore,noitalics]#[push-default]"
set-option -g   @format_cwin_right_alt  "#[default]"
set-option -g   @format_cwin_center_alt "#[fg=#{E:@fg_cwin_alt},bg=#{E:@bg_cwin_alt}]"
set-option -g   @format_pane_left       "#[fg=#{E:@bg_pane},nobold,nounderscore,noitalics]#[push-default]"
set-option -g   @format_pane_right      "#[default]"
set-option -g   @format_pane_center     "#[fg=#{E:@fg_pane},bg=#{E:@bg_pane}]"
set-option -g   @format_apane_left      "#[fg=#{E:@bg_apane},nobold,nounderscore,noitalics]#[push-default]"
set-option -g   @format_apane_right     "#[default]"
set-option -g   @format_apane_center    "#[fg=#{E:@fg_apane},bg=#{E:@bg_apane}]"
#: }}}
#: Helpers {{{
set-option -wg  @before_cwin        "#{>:0,#{e|-|:#{window_index},#{active_window_index}}}"
set-option -wg  @after_cwin         "#{<:0,#{e|-|:#{window_index},#{active_window_index}}}"
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
set-option -wga @pane_current_path_styled     "#{E:@pane_current_path}"
set-option -wga @pane_current_path_styled "}"
#: }}}
#: Styled pane title {{{
set-option -wg  @pane_title_styled "#{?@pane_title,#{E:@pane_title},#{E:@pane_current_path_styled}}"
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
set-option -ga  @window_flags_fwid   "s|#|＃|;"
set-option -ga  @window_flags_fwid   "s|!|！|;"
set-option -ga  @window_flags_fwid   "s|~|～|;"
set-option -ga  @window_flags_fwid   "s|*|＊|;"
set-option -ga  @window_flags_fwid   "s|-|－|;"
set-option -ga  @window_flags_fwid   "s|M|Ｍ|;"
set-option -ga  @window_flags_fwid   "s|Z|Ｚ|;"
set-option -ga  @window_flags_fwid   ":window_raw_flags"
set-option -ga  @window_flags_fwid "}"
set-option -g   @window_zoomed_icon "#{?window_zoomed_flag,  ,}"
set-option -wg  automatic-rename-format ""
set-option -wg  @window_renamed "#{!=:#{window_name},}"
#: }}}
#: Format status line {{{
set-option -g   status on
set-option -g   status-left-length 100
set-option -g   status-right-length 100
set-option -g   status-justify absolute-centre
set-option -gF  status-style "none,bg=#{E:@bg}"
set-option -gF  status-left-style none
set-option -gF  status-right-style none
set-option -gF  window-status-activity-style none
set-option -gF  window-status-style none
set-option -g   status-left ""
set-option -ga  status-left "#{?client_prefix,"
set-option -ga  status-left   "#{E:@format_AA}#{E:@content_a}"
set-option -ga  status-left   "#{E:@format_Ab}#{E:@symbol_ab}"
set-option -ga  status-left   ","
set-option -ga  status-left   "#{E:@format_aa}#{E:@content_a}"
set-option -ga  status-left   "#{E:@format_ab}#{E:@symbol_ab}"
set-option -ga  status-left "}"
set-option -ga  status-left "#{E:@format_bb}#{E:@content_b}"
set-option -ga  status-left "#{E:@format_bc}#{E:@symbol_bc}"
set-option -ga  status-left "#{E:@format_cc}#{E:@content_c}"
set-option -g   status-right ""
set-option -ga  status-right "#{E:@format_xx}#{E:@content_x}"
set-option -ga  status-right "#{E:@format_xy}#{E:@symbol_xy}"
set-option -ga  status-right "#{E:@format_yy}#{E:@content_y}"
set-option -ga  status-right "#{E:@format_yz}#{E:@symbol_yz}"
set-option -ga  status-right "#{E:@format_zz}#{E:@content_z}"
set-option -wg  window-status-separator ""
set-option -wg  window-status-format ""
set-option -wga window-status-format "#{?window_marked_flag,"
set-option -wga window-status-format   "#{E:@format_win_left_alt}"
set-option -wga window-status-format     "#{E:@symbol_win_left}"
set-option -wga window-status-format   "#{E:@format_win_center_alt}"
set-option -wga window-status-format     " "
set-option -wga window-status-format     "#{E:@window_index_fwid}."
set-option -wga window-status-format     " "
set-option -wga window-status-format     "#{?#{E:@window_renamed},#{window_name},#{E:@pane_current_path_styled}}"
set-option -wga window-status-format     "#{E:@window_zoomed_icon}"
set-option -wga window-status-format     " "
set-option -wga window-status-format   "#{E:@format_win_right_alt}"
set-option -wga window-status-format     "#{E:@symbol_win_right}"
set-option -wga window-status-format   ","
set-option -wga window-status-format   "#{E:@format_win_left}"
set-option -wga window-status-format     "#{E:@symbol_win_left}"
set-option -wga window-status-format   "#{E:@format_win_center}"
set-option -wga window-status-format     " "
set-option -wga window-status-format     "#{E:@window_index_fwid}."
set-option -wga window-status-format     " "
set-option -wga window-status-format     "#{?#{E:@window_renamed},#{window_name},#{E:@pane_current_path_styled}}"
set-option -wga window-status-format     "#{E:@window_zoomed_icon}"
set-option -wga window-status-format     " "
set-option -wga window-status-format   "#{E:@format_win_right}"
set-option -wga window-status-format     "#{E:@symbol_win_right}"
set-option -wga window-status-format "}"
set-option -wg  window-status-current-format ""
set-option -wga window-status-current-format "#{?window_marked_flag,"
set-option -wga window-status-current-format   "#{E:@format_cwin_left_alt}"
set-option -wga window-status-current-format     "#{E:@symbol_cwin_left}"
set-option -wga window-status-current-format   "#{E:@format_cwin_center_alt}"
set-option -wga window-status-current-format     " "
set-option -wga window-status-current-format     "#{E:@window_index_fwid}."
set-option -wga window-status-current-format     " "
set-option -wga window-status-current-format     "#{?#{E:@window_renamed},#{window_name},#{E:@pane_current_path_styled}}"
set-option -wga window-status-current-format     "#{E:@window_zoomed_icon}"
set-option -wga window-status-current-format     " "
set-option -wga window-status-current-format   "#{E:@format_cwin_right_alt}"
set-option -wga window-status-current-format     "#{E:@symbol_cwin_right}"
set-option -wga window-status-current-format   ","
set-option -wga window-status-current-format   "#{E:@format_cwin_left}"
set-option -wga window-status-current-format     "#{E:@symbol_cwin_left}"
set-option -wga window-status-current-format   "#{E:@format_cwin_center}"
set-option -wga window-status-current-format     " "
set-option -wga window-status-current-format     "#{E:@window_index_fwid}."
set-option -wga window-status-current-format     " "
set-option -wga window-status-current-format     "#{?#{E:@window_renamed},#{window_name},#{E:@pane_current_path_styled}}"
set-option -wga window-status-current-format     "#{E:@window_zoomed_icon}"
set-option -wga window-status-current-format     " "
set-option -wga window-status-current-format   "#{E:@format_cwin_right}"
set-option -wga window-status-current-format     "#{E:@symbol_cwin_right}"
set-option -wga window-status-current-format "}"
set-option -wg  pane-border-status top
set-option -wg  pane-border-format ""
set-option -wga pane-border-format "#{?pane_active,"
set-option -wga pane-border-format   "#{E:@format_apane_left}"
set-option -wga pane-border-format     "#{E:@symbol_apane_left}"
set-option -wga pane-border-format   "#{E:@format_apane_center}"
set-option -wga pane-border-format     " "
set-option -wga pane-border-format     "#{E:@pane_title_styled}"
set-option -wga pane-border-format     "#{E:@window_zoomed_icon}"
set-option -wga pane-border-format     " "
set-option -wga pane-border-format   "#{E:@format_apane_right}"
set-option -wga pane-border-format     "#{E:@symbol_apane_right}"
set-option -wga pane-border-format   ","
set-option -wga pane-border-format   "#{E:@format_pane_left}"
set-option -wga pane-border-format     "#{E:@symbol_pane_left}"
set-option -wga pane-border-format   "#{E:@format_pane_center}"
set-option -wga pane-border-format     " "
set-option -wga pane-border-format     "#{E:@pane_title_styled}"
set-option -wga pane-border-format     " "
set-option -wga pane-border-format   "#{E:@format_pane_right}"
set-option -wga pane-border-format     "#{E:@symbol_pane_right}"
set-option -wga pane-border-format "}"
#: }}}
#: }}}

set-option -g status-interval 1
