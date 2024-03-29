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
set-option -g   @status_right_xx_symbol_resolved "#{s|\n*([^\n]+).*|\\1|;s|\n*||:"
set-option -ga  @status_right_xx_symbol_resolved   "\n#{T:@status_right_xx_symbol}"
set-option -ga  @status_right_xx_symbol_resolved   "\n#{T:@symbol_rtl_sep}"
set-option -ga  @status_right_xx_symbol_resolved "}"
set-option -g   @status_right_xy_symbol_resolved "#{s|\n*([^\n]+).*|\\1|;s|\n*||:"
set-option -ga  @status_right_xy_symbol_resolved   "\n#{T:@status_right_xy_symbol}"
set-option -ga  @status_right_xy_symbol_resolved   "\n#{T:@symbol_rtl}"
set-option -ga  @status_right_xy_symbol_resolved "}"
set-option -g   @status_right_yy_symbol_resolved "#{s|\n*([^\n]+).*|\\1|;s|\n*||:"
set-option -ga  @status_right_yy_symbol_resolved   "\n#{T:@status_right_xy_symbol}"
set-option -ga  @status_right_yy_symbol_resolved   "\n#{T:@symbol_rtl_sep}"
set-option -ga  @status_right_yy_symbol_resolved "}"
set-option -g   @status_right_yz_symbol_resolved "#{s|\n*([^\n]+).*|\\1|;s|\n*||:"
set-option -ga  @status_right_yz_symbol_resolved   "\n#{T:@status_right_yz_symbol}"
set-option -ga  @status_right_yz_symbol_resolved   "\n#{T:@symbol_rtl}"
set-option -ga  @status_right_yz_symbol_resolved "}"
set-option -g   @status_right_zz_symbol_resolved "#{s|\n*([^\n]+).*|\\1|;s|\n*||:"
set-option -ga  @status_right_zz_symbol_resolved   "\n#{T:@status_right_yz_symbol}"
set-option -ga  @status_right_zz_symbol_resolved   "\n#{T:@symbol_rtl_sep}"
set-option -ga  @status_right_zz_symbol_resolved "}"
set-option -g   @status_right_xx_symbol_rendered "#{?#{m|r:&#{T:@status_right_xx_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -ga  @status_right_xx_symbol_rendered   "#{"
set-option -ga  @status_right_xx_symbol_rendered     "s|.*&#{T:@status_right_xx_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_right_xx_symbol_rendered     ":@symbols"
set-option -ga  @status_right_xx_symbol_rendered   "},"
set-option -ga  @status_right_xx_symbol_rendered   "#{T:@status_right_xx_symbol_resolved}"
set-option -ga  @status_right_xx_symbol_rendered "}"
set-option -g   @status_right_xy_symbol_rendered "#{?#{m|r:&#{T:@status_right_xy_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -ga  @status_right_xy_symbol_rendered   "#{"
set-option -ga  @status_right_xy_symbol_rendered     "s|.*&#{T:@status_right_xy_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_right_xy_symbol_rendered     ":@symbols"
set-option -ga  @status_right_xy_symbol_rendered   "},"
set-option -ga  @status_right_xy_symbol_rendered   "#{T:@status_right_xy_symbol_resolved}"
set-option -ga  @status_right_xy_symbol_rendered "}"
set-option -g   @status_right_yz_symbol_rendered "#{?#{m|r:&#{T:@status_right_yz_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -ga  @status_right_yz_symbol_rendered   "#{"
set-option -ga  @status_right_yz_symbol_rendered     "s|.*&#{T:@status_right_yz_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_right_yz_symbol_rendered     ":@symbols"
set-option -ga  @status_right_yz_symbol_rendered   "},"
set-option -ga  @status_right_yz_symbol_rendered   "#{T:@status_right_yz_symbol_resolved}"
set-option -ga  @status_right_yz_symbol_rendered "}"
set-option -g   @status_right_x_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_right_x_content}}"
set-option -g   @status_right_y_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_right_y_content}}"
set-option -g   @status_right_z_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_right_z_content}}"
set-option -g   status-right ""
set-option -ga  status-right "#{T:@status_right_xx_style}"
set-option -ga  status-right "#{T:@status_right_x_content_padded}"
set-option -ga  status-right "#{T:@status_right_xy_style}"
set-option -ga  status-right "#{T:@status_right_xy_symbol_rendered}"
set-option -ga  status-right "#{T:@status_right_yy_style}"
set-option -ga  status-right "#{T:@status_right_y_content_padded}"
set-option -ga  status-right "#{T:@status_right_yz_style}"
set-option -ga  status-right "#{T:@status_right_yz_symbol_rendered}"
set-option -ga  status-right "#{T:@status_right_zz_style}"
set-option -ga  status-right "#{T:@status_right_z_content_padded}"
#: }}}
