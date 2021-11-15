import sublime
import sublime_plugin


class GroupHasTransientSheetEventListener(sublime_plugin.ViewEventListener):
	def on_query_context(self, key, operator, operand, match_all):
		if key == 'group_has_transient_sheet':
			group_has_transient_sheet = len(sublime.active_window().views()) == 0
			if operator == sublime.OP_EQUAL:
				return group_has_transient_sheet == operand
			elif operator == sublime.OP_NOT_EQUAL:
				return group_has_transient_sheet != operand
		return None
