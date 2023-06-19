#: Helpers {{{
set-option -wg  @before_active_window "#{>:0,#{e|-|:#{window_index},#{active_window_index}}}"
set-option -wg  @after_active_window  "#{<:0,#{e|-|:#{window_index},#{active_window_index}}}"
set-option -wg  @window_renamed "#{!=:#{window_name},}"
#: }}}

#: Sessions {{{
set-option -g   @prev_session_name "#{s|\n#{client_session}\n.*||;s|.*\n||:\n#{S:#{session_name}\n}}"
set-option -g   @next_session_name "#{s|.*\n#{client_session}\n||;s|\n.*||:\n#{S:#{session_name}\n}}"
set-option -g   @first_session_name "#{s|\n.*||:#{S:#{session_name}\n}}"
set-option -g   @last_session_name "#{s|.*\n||:#{S:\n#{session_name}}}"
set-option -g   @current_session "#{==:#{client_session},#{session_name}}"
set-option -g   @prev_session "#{==:#{E:@prev_session_name},#{session_name}}"
set-option -g   @next_session "#{==:#{E:@next_session_name},#{session_name}}"
set-option -g   @first_session "#{==:#{E:@first_session_name},#{session_name}}"
set-option -g   @last_session "#{==:#{E:@last_session_name},#{session_name}}"
set-option -g   @before_current_session "#{m|r:.*\n#{session_name}\n.*\n#{client_session}\n,#{S:\n#{session_name}\n}}"
set-option -g   @after_current_session "#{m|r:.*\n#{client_session}\n.*\n#{session_name}\n,#{S:\n#{session_name}\n}}"
#: }}}

#: Session index {{{
set-option -g  @session_index "#{"
set-option -ga @session_index   "s|\n#{session_name}\n.*|\n|;"
set-option -ga @session_index   "s|[^\n]+||;"
set-option -ga @session_index   "s|^\n$|1|;"
set-option -ga @session_index   "s|^\n\n$|2|;"
set-option -ga @session_index   "s|^\n\n\n$|3|;"
set-option -ga @session_index   "s|^\n\n\n\n$|4|;"
set-option -ga @session_index   "s|^\n\n\n\n\n$|5|;"
set-option -ga @session_index   "s|^\n\n\n\n\n\n$|6|;"
set-option -ga @session_index   "s|^\n\n\n\n\n\n\n$|7|;"
set-option -ga @session_index   "s|^\n\n\n\n\n\n\n\n$|8|;"
set-option -ga @session_index   "s|^\n\n\n\n\n\n\n\n\n$|9|;"
set-option -ga @session_index     ":#{S:\n#{session_name}}\n"
set-option -ga @session_index "}"
#: }}}

#: Styled session index {{{
set-option -wg  @session_index_fwid ""
set-option -wga @session_index_fwid "#{"
set-option -wga @session_index_fwid   "s|0|０|;"
set-option -wga @session_index_fwid   "s|1|１|;"
set-option -wga @session_index_fwid   "s|2|２|;"
set-option -wga @session_index_fwid   "s|3|３|;"
set-option -wga @session_index_fwid   "s|4|４|;"
set-option -wga @session_index_fwid   "s|5|５|;"
set-option -wga @session_index_fwid   "s|6|６|;"
set-option -wga @session_index_fwid   "s|7|７|;"
set-option -wga @session_index_fwid   "s|8|８|;"
set-option -wga @session_index_fwid   "s|9|９|;"
set-option -wga @session_index_fwid   ":#{E:@session_index}"
set-option -wga @session_index_fwid "}"
#: }}}

#: Styled pane current path {{{
set-option -wg  @pane_current_path ""
set-option -wga @pane_current_path "#{?"
set-option -wga @pane_current_path   "#{m|:^@vim@,#{pane_title}},"
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

#: Session index name {{{
set-option -g   @session_index_fwid_name ""
set-option -ga  @session_index_fwid_name "#{E:@session_index_fwid}"
set-option -ga  @session_index_fwid_name "#{?#{m|r:^[0-9]+$,#{session_name}},,. #[bold]#{session_name}}"
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
