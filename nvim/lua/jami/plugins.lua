vim.cmd [[packadd packer.nvim]]

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

return require('packer').startup({function()
   use 'wbthomason/packer.nvim'
   -- use 'Mofiqul/dracula.nvim'
   -- use 'neanias/everforest-nvim'
    use 'ellisonleao/gruvbox.nvim'
	use "norcalli/nvim-colorizer.lua"-- highlighter
	use "windwp/nvim-autopairs" 		-- auto pair "" () {} 
	use "junegunn/limelight.vim" 		-- distraction free vim

    use "nvim-lua/plenary.nvim"

	use "neovim/nvim-lspconfig" 		-- lsp servers
	use "hrsh7th/cmp-nvim-lsp" 		-- lsp server completion
	use "hrsh7th/cmp-buffer" 			-- buffer completion 
	use "hrsh7th/cmp-path" 				-- path completion 
	use "hrsh7th/nvim-cmp"  			-- neovim completion 

	use "L3MON4D3/LuaSnip" 				-- enable snippet 

	use {"kyazdani42/nvim-tree.lua",
			requires="kyazdani42/nvim-web-devicons"}

	use "nvim-lualine/lualine.nvim"
	use "akinsho/bufferline.nvim"

	use "nvim-treesitter/nvim-treesitter"

	use {"nvim-telescope/telescope.nvim",
			requires="nvim-lua/plenary.nvim"}
	use "jose-elias-alvarez/null-ls.nvim" -- linter formatter

  use("mbbill/undotree")
  use("tpope/vim-fugitive")

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")

  -- # SYNC TO JUPYTER NOTEBOOK 
  use { "kiyoon/jupynium.nvim", run = "pip3 install --user ." }

    if packer_bootstrap then
    require('packer').sync()
    end
end,

config = {
  profile = {
    enable = true,
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile

  }
}})
