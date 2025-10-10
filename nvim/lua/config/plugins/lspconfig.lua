return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },

					},
				},
			}
		},
		config = function()
			-- Autoformat on save
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local c = vim.lsp.get_client_by_id(args.data.client_id)
					if not c then return end

					if vim.bo.filetype == "lua" then
						-- Format the current buffer on save
						vim.api.nvim_create_autocmd('BufWritePre', {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
							end,
						})
					else
						require("conform").format({ bufnr = args.buf, id = c.id })
					end

				end,
			})

			-- LSP Config for Lua
			local capabilities = require('blink.cmp').get_lsp_capabilities()
			vim.lsp.config['lua_ls'] = {
				cmd = { 'lua-language-server' },
				filetypes = { 'lua' },
				root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git', },
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
					}
				}
			}

			-- LSP Config for rust
			vim.lsp.config['rust_analyzer'] = {
				cmd = { 'rust-analyzer' },
				capabilities = capabilities,
				filetypes = { 'rust' },
				on_attach = function(client, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true
						},
					},
				}
			}

			-- Enable the lsp
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("lua_ls")
		end,
	}
}
