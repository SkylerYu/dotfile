local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
--保存此文件自动更新安装软件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'cocopon/iceberg.vim' --主题
  use {  --lualine
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
} 
  use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		}
	}
  use "nvim-treesitter/nvim-treesitter" --语法高亮
  use "p00f/nvim-ts-rainbow" --配合treesitter,不同括号颜色区分
  use { --lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neonvim/nvim-lspconfig"
  }
  --自动补全
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")
  use("hrsh7th/cmp-path")

  use "numToStr/Comment.nvim" --gcc和gc注释
  use "windwp/nvim-autopairs" --自动补全括号

  use "akinsho/bufferline.nvim" --buffer分割线
  use "lewis6991/gitsigns.nvim" --左侧git提示
  use {
     'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
