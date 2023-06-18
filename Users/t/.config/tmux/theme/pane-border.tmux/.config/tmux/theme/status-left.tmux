set-option -g   @prev_session_name "#{s|\n#{client_session}\n.*||r;s|.*\n||r:\n#{S:#{session_name}\n}}"
set-option -g   @next_session_name "#{s|.*\n#{client_session}\n||r;s|\n.*||r:\n#{S:#{session_name}\n}}"
set-option -g   @first_session_name "#{s|\n.*||r:#{S:#{session_name}\n}}"
set-option -g   @last_session_name "#{s|.*\n||r:#{S:\n#{session_name}}}"
set-option -g   @current_session "#{==:#{client_session},#{session_name}}"
set-option -g   @prev_session "#{==:#{E:@prev_session_name},#{session_name}}"
set-option -g   @next_session "#{==:#{E:@next_session_name},#{session_name}}"
set-option -g   @first_session "#{==:#{E:@first_session_name},#{session_name}}"
set-option -g   @last_session "#{==:#{E:@last_session_name},#{session_name}}"
set-option -g   @before_current_session "#{m|r:.*\n#{session_name}\n.*\n#{client_session}\n,#{S:\n#{session_name}\n}}"
set-option -g   @after_current_session "#{m|r:.*\n#{client_session}\n.*\n#{session_name}\n,#{S:\n#{session_name}\n}}"
#: Status left {{{
set-option -s   @status_left_a_content "#{session_name}"
set-option -s   @status_left_b_content ""
set-option -s   @status_left_c_content ""
set-option -s   @status_left_ab_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_a_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_b_bg}} nobold nounderscore noitalics]"
set-option -s   @status_left_Ab_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_A_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_b_bg}} nobold nounderscore noitalics]"
set-option -s   @status_left_bc_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_b_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_c_bg}} nobold nounderscore noitalics]"
set-option -s   @status_left_ac_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_a_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_c_bg}} nobold nounderscore noitalics]"
set-option -s   @status_left_Ac_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_A_bg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_c_bg}} nobold nounderscore noitalics]"
set-option -s   @status_left_aa_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_a_fg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_a_bg}} bold]"
set-option -s   @status_left_bb_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_b_fg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_b_bg}}]"
set-option -s   @status_left_cc_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_c_fg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_c_bg}}]"
set-option -s   @status_left_AA_style "#[#{s|^[^\S]+\\|[^\S]+$||g;s|.+|fg=\\0|:#{T:@status_left_A_fg}} #{s|^[^\S]+\\|[^\S]+$||g;s|.+|bg=\\0|:#{T:@status_left_A_bg}} bold]"
set-option -s   @status_left_aa_symbol_resolved "#{s|,*([^,]+).*|\\1|r;s|,*||r:"
set-option -sa  @status_left_aa_symbol_resolved   ",#{T:@status_left_aa_symbol}"
set-option -sa  @status_left_aa_symbol_resolved   ",#{T:@symbol_ltr_sep}"
set-option -sa  @status_left_aa_symbol_resolved "}"
set-option -s   @status_left_ab_symbol_resolved "#{s|,*([^,]+).*|\\1|r;s|,*||r:"
set-option -sa  @status_left_ab_symbol_resolved   ",#{T:@status_left_ab_symbol}"
set-option -sa  @status_left_ab_symbol_resolved   ",#{T:@symbol_ltr}"
set-option -sa  @status_left_ab_symbol_resolved "}"
set-option -s   @status_left_bb_symbol_resolved "#{s|,*([^,]+).*|\\1|r;s|,*||r:"
set-option -sa  @status_left_bb_symbol_resolved   ",#{T:@status_left_bb_symbol}"
set-option -sa  @status_left_bb_symbol_resolved   ",#{T:@symbol_ltr_sep}"
set-option -sa  @status_left_bb_symbol_resolved "}"
set-option -s   @status_left_bc_symbol_resolved "#{s|,*([^,]+).*|\\1|r;s|,*||r:"
set-option -sa  @status_left_bc_symbol_resolved   ",#{T:@status_left_bc_symbol}"
set-option -sa  @status_left_bc_symbol_resolved   ",#{T:@symbol_ltr}"
set-option -sa  @status_left_bc_symbol_resolved "}"
set-option -s   @status_left_cc_symbol_resolved "#{s|,*([^,]+).*|\\1|r;s|,*||r:"
set-option -sa  @status_left_cc_symbol_resolved   ",#{T:@status_left_cc_symbol}"
set-option -sa  @status_left_cc_symbol_resolved   ",#{T:@symbol_ltr_sep}"
set-option -sa  @status_left_cc_symbol_resolved "}"
set-option -s   @status_left_aa_symbol_rendered "#{?#{m|r:&#{T:@status_left_aa_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -sa  @status_left_aa_symbol_rendered   "#{"
set-option -sa  @status_left_aa_symbol_rendered     "s|.*&#{T:@status_left_aa_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -sa  @status_left_aa_symbol_rendered     ":@symbols"
set-option -sa  @status_left_aa_symbol_rendered   "},"
set-option -sa  @status_left_aa_symbol_rendered   "#{T:@status_left_aa_symbol_resolved}"
set-option -sa  @status_left_aa_symbol_rendered "}"
set-option -s   @status_left_ab_symbol_rendered "#{?#{m|r:&#{T:@status_left_ab_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -sa  @status_left_ab_symbol_rendered   "#{"
set-option -sa  @status_left_ab_symbol_rendered     "s|.*&#{T:@status_left_ab_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -sa  @status_left_ab_symbol_rendered     ":@symbols"
set-option -sa  @status_left_ab_symbol_rendered   "},"
set-option -sa  @status_left_ab_symbol_rendered   "#{T:@status_left_ab_symbol_resolved}"
set-option -sa  @status_left_ab_symbol_rendered "}"
set-option -s   @status_left_bc_symbol_rendered "#{?#{m|r:&#{T:@status_left_bc_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -sa  @status_left_bc_symbol_rendered   "#{"
set-option -sa  @status_left_bc_symbol_rendered     "s|.*&#{T:@status_left_bc_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -sa  @status_left_bc_symbol_rendered     ":@symbols"
set-option -sa  @status_left_bc_symbol_rendered   "},"
set-option -sa  @status_left_bc_symbol_rendered   "#{T:@status_left_bc_symbol_resolved}"
set-option -sa  @status_left_bc_symbol_rendered "}"
set-option -s   @status_left_cc_symbol_rendered "#{?#{m|r:&#{T:@status_left_cc_symbol_resolved}\s*=,#{T:@symbols}},"
set-option -sa  @status_left_cc_symbol_rendered   "#{"
set-option -sa  @status_left_cc_symbol_rendered     "s|.*&#{T:@status_left_cc_symbol_resolved}\s*=\s*([^\s]).*|\\1|;"
set-option -sa  @status_left_cc_symbol_rendered     ":@symbols"
set-option -sa  @status_left_cc_symbol_rendered   "},"
set-option -sa  @status_left_cc_symbol_rendered   "#{T:@status_left_cc_symbol_resolved}"
set-option -sa  @status_left_cc_symbol_rendered "}"
set-option -s   @status_left_a_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_left_a_content}}"
set-option -s   @status_left_b_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_left_b_content}}"
set-option -s   @status_left_c_content_padded "#{s|^[^\S]+\\|[^\S]+$||g;s|.*| \\0 |:#{T:@status_left_c_content}}"
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

set-option -g   status-left ""
set-option -ga  status-left "#{S:"
set-option -ga  status-left   "#{?#{E:@current_session},"
set-option -ga  status-left     "#{?#{E:@first_session},,"
set-option -ga  status-left       "#[fg=#{E:@status_left_a_bg} bg=#{E:@status_left_b_bg}]"
set-option -ga  status-left       "#{E:@symbol_rtl_rendered}"
set-option -ga  status-left     "}"
set-option -ga  status-left     "#[fg=#{E:@status_left_a_fg} bg=#{E:@status_left_a_bg}]"
set-option -ga  status-left     "  #[bold]#{session_name}  "
set-option -ga  status-left     "#{?#{E:@last_session},"
set-option -ga  status-left       "#[fg=#{E:@status_left_a_bg} bg=#{E:@status_bg}],"
set-option -ga  status-left       "#[fg=#{E:@status_left_a_bg} bg=#{E:@status_left_b_bg}]"
set-option -ga  status-left     "}"
set-option -ga  status-left     "#{E:@symbol_ltr_rendered}"
set-option -ga  status-left   ",}"
set-option -ga  status-left   "#{?#{E:@before_current_session},"
set-option -ga  status-left     "#{?#{E:@first_session},,"
set-option -ga  status-left       "#[fg=#{E:@status_bg} bg=#{E:@status_left_b_bg}]"
set-option -ga  status-left       "#{E:@symbol_rtl_sep_rendered}"
set-option -ga  status-left     "}"
set-option -ga  status-left     "#[fg=#{E:@status_left_b_fg} bg=#{E:@status_left_b_bg}]"
set-option -ga  status-left     "  #[bold]#{session_name} "
set-option -ga  status-left     "#[fg=#{E:@status_left_b_bg} bg=#{E:@status_left_b_bg}]"
set-option -ga  status-left     "#{E:@symbol_ltr_sep_rendered}"
set-option -ga  status-left   ",}"
set-option -ga  status-left   "#{?#{E:@after_current_session},"
set-option -ga  status-left     "#{?#{E:@first_session},,"
set-option -ga  status-left       "#[fg=#{E:@status_left_b_bg} bg=#{E:@status_left_b_bg}]"
set-option -ga  status-left       "#{E:@symbol_rtl_sep_rendered}"
set-option -ga  status-left     "}"
set-option -ga  status-left     "#[fg=#{E:@status_left_b_fg} bg=#{E:@status_left_b_bg}]"
set-option -ga  status-left     " #[bold]#{session_name}  "
set-option -ga  status-left     "#{?#{E:@last_session},"
set-option -ga  status-left       "#[fg=#{E:@status_left_b_bg} bg=#{E:@status_bg}]"
set-option -ga  status-left       "#{E:@symbol_ltr_rendered}"
set-option -ga  status-left       ","
set-option -ga  status-left       "#[fg=#{E:@status_bg} bg=#{E:@status_left_b_bg}]"
set-option -ga  status-left       "#{E:@symbol_ltr_sep_rendered}"
set-option -ga  status-left     "}"
set-option -ga  status-left   ",}"
set-option -ga  status-left "}"

#: }}}
