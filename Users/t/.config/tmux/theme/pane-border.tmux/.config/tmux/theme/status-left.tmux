#: Status left {{{
set-option -g   @status_left_a_content ""
set-option -ga  @status_left_a_content "#{s|^...||r:#{S:"
set-option -ga  @status_left_a_content   " 🮥 #{session_name}"
set-option -ga  @status_left_a_content "}}"
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
set-option -g   @status_left_aa_symbol_resolved "#{?@status_left_aa_symbol,"
set-option -ga  @status_left_aa_symbol_resolved   "#{T:@status_left_aa_symbol},"
set-option -ga  @status_left_aa_symbol_resolved   "#{T:@symbol_ltr_sep}"
set-option -ga  @status_left_aa_symbol_resolved "}"
set-option -g   @status_left_ab_symbol_resolved "#{?@status_left_ab_symbol,"
set-option -ga  @status_left_ab_symbol_resolved   "#{T:@status_left_ab_symbol},"
set-option -ga  @status_left_ab_symbol_resolved   "#{T:@symbol_ltr}"
set-option -ga  @status_left_ab_symbol_resolved "}"
set-option -g   @status_left_bb_symbol_resolved "#{?@status_left_bb_symbol,"
set-option -ga  @status_left_bb_symbol_resolved   "#{T:@status_left_bb_symbol},"
set-option -ga  @status_left_bb_symbol_resolved   "#{T:@symbol_ltr_sep}"
set-option -ga  @status_left_bb_symbol_resolved "}"
set-option -g   @status_left_bc_symbol_resolved "#{?@status_left_bc_symbol,"
set-option -ga  @status_left_bc_symbol_resolved   "#{T:@status_left_bc_symbol},"
set-option -ga  @status_left_bc_symbol_resolved   "#{T:@symbol_ltr}"
set-option -ga  @status_left_bc_symbol_resolved "}"
set-option -g   @status_left_cc_symbol_resolved "#{?@status_left_cc_symbol,"
set-option -ga  @status_left_cc_symbol_resolved   "#{T:@status_left_cc_symbol},"
set-option -ga  @status_left_cc_symbol_resolved   "#{T:@symbol_ltr_sep}"
set-option -ga  @status_left_cc_symbol_resolved "}"
set-option -g   @status_left_aa_symbol_rendered "#{?#{m|r:&#{T:@status_left_aa_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -ga  @status_left_aa_symbol_rendered   "#{"
set-option -ga  @status_left_aa_symbol_rendered     "s|.*&#{T:@status_left_aa_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_left_aa_symbol_rendered     ":@symbols"
set-option -ga  @status_left_aa_symbol_rendered   "},"
set-option -ga  @status_left_aa_symbol_rendered   "#{T:@status_left_aa_symbol_resolved}"
set-option -ga  @status_left_aa_symbol_rendered "}"
set-option -g   @status_left_ab_symbol_rendered "#{?#{m|r:&#{T:@status_left_ab_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -ga  @status_left_ab_symbol_rendered   "#{"
set-option -ga  @status_left_ab_symbol_rendered     "s|.*&#{T:@status_left_ab_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_left_ab_symbol_rendered     ":@symbols"
set-option -ga  @status_left_ab_symbol_rendered   "},"
set-option -ga  @status_left_ab_symbol_rendered   "#{T:@status_left_ab_symbol_resolved}"
set-option -ga  @status_left_ab_symbol_rendered "}"
set-option -g   @status_left_bc_symbol_rendered "#{?#{m|r:&#{T:@status_left_bc_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -ga  @status_left_bc_symbol_rendered   "#{"
set-option -ga  @status_left_bc_symbol_rendered     "s|.*&#{T:@status_left_bc_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_left_bc_symbol_rendered     ":@symbols"
set-option -ga  @status_left_bc_symbol_rendered   "},"
set-option -ga  @status_left_bc_symbol_rendered   "#{T:@status_left_bc_symbol_resolved}"
set-option -ga  @status_left_bc_symbol_rendered "}"
set-option -g   @status_left_cc_symbol_rendered "#{?#{m|r:&#{T:@status_left_cc_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -ga  @status_left_cc_symbol_rendered   "#{"
set-option -ga  @status_left_cc_symbol_rendered     "s|.*&#{T:@status_left_cc_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -ga  @status_left_cc_symbol_rendered     ":@symbols"
set-option -ga  @status_left_cc_symbol_rendered   "},"
set-option -ga  @status_left_cc_symbol_rendered   "#{T:@status_left_cc_symbol_resolved}"
set-option -ga  @status_left_cc_symbol_rendered "}"
set-option -g   @status_left_a_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_left_a_content}}"
set-option -g   @status_left_b_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_left_b_content}}"
set-option -g   @status_left_c_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_left_c_content}}"
set-option -g   status-left ""
set-option -ga  status-left "#{?client_prefix,"
set-option -ga  status-left   "#{T:@status_left_AA_style}"
set-option -ga  status-left   "#{T:@status_left_a_content_padded}"
set-option -ga  status-left   "#{T:@status_left_Ab_style}"
set-option -ga  status-left   "#{T:@status_left_ab_symbol_rendered}"
set-option -ga  status-left   ","
set-option -ga  status-left   "#{T:@status_left_aa_style}"
set-option -ga  status-left   "#{T:@status_left_a_content_padded}"
set-option -ga  status-left   "#{T:@status_left_ab_style}"
set-option -ga  status-left   "#{T:@status_left_ab_symbol_rendered}"
set-option -ga  status-left "}"
set-option -ga  status-left "#{T:@status_left_bb_style}"
set-option -ga  status-left "#{T:@status_left_bb_style}"
set-option -ga  status-left "#{T:@status_left_b_content_padded}"
set-option -ga  status-left "#{T:@status_left_bc_style}"
set-option -ga  status-left "#{T:@status_left_bc_symbol_rendered}"
set-option -ga  status-left "#{T:@status_left_cc_style}"
set-option -ga  status-left "#{T:@status_left_c_content_padded}"
#: }}}
