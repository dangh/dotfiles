#: Window separator {{{
set-option -g   @prev_window_separator_symbol_resolved "#{s|\n*([^\n]+).*|\\1|;s|\n*||:"
set-option -ga  @prev_window_separator_symbol_resolved   "\n#{T:@prev_window_separator_symbol}"
set-option -ga  @prev_window_separator_symbol_resolved   "\n#{T:@symbol_rtl_sep}"
set-option -ga  @prev_window_separator_symbol_resolved "}"
set-option -g   @next_window_separator_symbol_resolved "#{s|\n*([^\n]+).*|\\1|;s|\n*||:"
set-option -ga  @next_window_separator_symbol_resolved   "\n#{T:@next_window_separator_symbol}"
set-option -ga  @next_window_separator_symbol_resolved   "\n#{T:@symbol_ltr_sep}"
set-option -ga  @next_window_separator_symbol_resolved "}"
set-option -g   @prev_window_separator_symbol_rendered "#{?#{m|r:&#{T:@prev_window_separator_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -ga  @prev_window_separator_symbol_rendered   "#{"
set-option -ga  @prev_window_separator_symbol_rendered     "s|.*&#{T:@prev_window_separator_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @prev_window_separator_symbol_rendered     ":@symbols"
set-option -ga  @prev_window_separator_symbol_rendered   "},"
set-option -ga  @prev_window_separator_symbol_rendered   "#{T:@prev_window_separator_symbol_resolved}"
set-option -ga  @prev_window_separator_symbol_rendered "}"
set-option -g   @next_window_separator_symbol_rendered "#{?#{m|r:&#{T:@next_window_separator_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -ga  @next_window_separator_symbol_rendered   "#{"
set-option -ga  @next_window_separator_symbol_rendered     "s|.*&#{T:@next_window_separator_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @next_window_separator_symbol_rendered     ":@symbols"
set-option -ga  @next_window_separator_symbol_rendered   "},"
set-option -ga  @next_window_separator_symbol_rendered   "#{T:@next_window_separator_symbol_resolved}"
set-option -ga  @next_window_separator_symbol_rendered "}"
set-option -g   @window_separator_style "#[nobold nounderscore noitalics"
set-option -ga  @window_separator_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@window_separator_fg}}"
set-option -ga  @window_separator_style " #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@window_separator_bg}}"
set-option -ga  @window_separator_style "]"
set-option -g   @prev_window_separator "#{T:@window_separator_style]#{T:@prev_window_separator_symbol_rendered}"
set-option -g   @next_window_separator "#{T:@window_separator_style]#{T:@next_window_separator_symbol_rendered}"
set-option -g   window-status-separator ""
set-option -gaF window-status-separator "#{?#{T:@before_active_window},#{T:@prev_window_separator},}"
set-option -gaF window-status-separator "#{?#{T:@after_active_window},#{T:@next_window_separator},}"
#: }}}