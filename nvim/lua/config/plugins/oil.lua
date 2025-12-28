vim.api.nvim_set_hl(0,"OilDarkBackground", { bg = "#161714" })

return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
		config = function()
			require("oil").setup({
				watch_for_changes = true,
				view_options = {
					show_hidden = true,
					is_hidden_file = function(name, bufnr)
						local m = name:match("^%.")
						return m ~= nil
					end,
				},
				float = {
					padding = 2,
					max_width = 0.5,
					max_height = 0.6,
					win_options = {
						winblend = 0,
            winhighlight="Normal:OilDarkBackground",
					},
					border = 1,
					get_win_title = nil,
					preview_split = "right",
					-- This is the config that will be passed to nvim_open_win.
					-- Change values here to customize the layout
					override = function(conf)
						return conf
					end,
				},
			})
		end,
	},
}
