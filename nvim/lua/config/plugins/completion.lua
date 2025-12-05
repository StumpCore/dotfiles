return {
	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = 'super-tab' },

			appearance = {
				nerd_font_variant = 'mono'
			},

			completion = {  
        keyword={range='full'},
        documentation = { auto_show = false },
        ghost_text = {enabled=true},
        trigger={show_on_keyword=true}

      },

			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
      snippets = { preset = 'default' }
		},
		opts_extend = { "sources.default" }
	}
}
