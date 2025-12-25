local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

--- Themes
require("lazy").setup({
	spec = {
		-- {
		-- 	"bluz71/vim-moonfly-colors",
		-- 	name = "moonfly",
		-- 	lazy = false,
		-- 	priority = 1000,
		-- 	config = function()
		-- 		vim.cmd.colorscheme("moonfly")
		-- 	end,
		-- },
		-- {
		-- 	"folke/tokyonight.nvim",
		-- 	config = function()
		-- 		vim.cmd.colorscheme("tokyonight")
		-- 	end,
		-- },
		-- {
		-- 	"zootedb0t/citruszest.nvim",
		-- 	lazy = false,
		-- 	priority = 1000,
		-- 	config = function()
		-- 		vim.cmd.colorscheme("citruszest")
		-- 	end,
		-- },
		-- {
		-- 	"xero/miasma.nvim",
		-- 	lazy = false,
		-- 	priority = 1000,
		-- 	config = function()
		-- 		vim.cmd("colorscheme miasma")
		-- 	end,
		-- },
		-- {
		-- 	"savq/melange-nvim",
		-- 	config = function()
		-- 		vim.cmd.colorscheme("melange")
		-- end,
		-- },
    -- Using lazy.nvim
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
      }
      require('bamboo').load()
    end,
  },
		{ import = "config.plugins" },
	},
})

require("lazydev").setup({
	library = { "nvim-dap-ui" },
})
