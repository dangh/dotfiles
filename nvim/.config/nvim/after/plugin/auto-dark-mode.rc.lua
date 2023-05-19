local status, auto_dark_mode = pcall(require, 'auto-dark-mode')
if (not status) then return end

auto_dark_mode.setup {
  update_interval = 1000,
  set_dark_mode = function()
    vim.api.nvim_set_option('background', 'dark')
    vim.cmd('let g:everforest_background = "hard"')
    vim.cmd('let g:everforest_better_performance = 1')
    vim.cmd('colorscheme everforest')
  end,
  set_light_mode = function()
    local background = 'light'
    if (os.getenv('TMUX')) then
      background = 'dark'
    end
    vim.api.nvim_set_option('background', background)
    vim.cmd('let g:everforest_background = "hard"')
    vim.cmd('let g:everforest_better_performance = 1')
    vim.cmd('colorscheme everforest')
  end,
}

auto_dark_mode.init()
