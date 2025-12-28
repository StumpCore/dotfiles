return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', 
		-- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		}
	},
	keys = {
		{ "<leader>fg", mode = "n", silent = true }

	},
	config = function()
		-- Default setup for the telescope
		require("telescope").setup {
			pickers = {
				find_files = {
					theme = "ivy"
				},
				extensions = {
					fzf = {},
				}

			}
		}
		-- loading exentions
		require('telescope').load_extension('fzf')
		require("config.telescope.multigrep").setup()
	end
}
