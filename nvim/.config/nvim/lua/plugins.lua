local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[ packadd packer.nvim ]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- use 'neanias/everforest-nvim'
  use {
    'sainnhe/everforest',
    run = function()
      vim.cmd [[ colorscheme everforest ]]
    end
  }

  -- use { 'navarasu/onedark.nvim', opt = true }

  -- use { 'rose-pine/neovim', as = 'rose-pine', opt = true }

  use 'f-person/auto-dark-mode.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' }

  use 'terrortylor/nvim-comment'

  -- jump arround
  use 'https://gitlab.com/madyanov/svart.nvim'

  use 'kylechui/nvim-surround'

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
