import sublime
import sublime_plugin


class NoopCommand(sublime_plugin.WindowCommand):
  def run(self):
    pass
  def is_visible(self):
    return False
