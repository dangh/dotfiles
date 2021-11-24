import sublime
import sublime_plugin


class TogglePreferencesCommand(sublime_plugin.ApplicationCommand):
    def run(self, setting, persist=False):
        pref = sublime.load_settings("Preferences.sublime-settings")
        pref.set(setting, not pref.get(setting, False))
        if persist:
            sublime.save_settings("Preferences.sublime-settings")
