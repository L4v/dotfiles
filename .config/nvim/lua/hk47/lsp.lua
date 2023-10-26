local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		exapnd = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
		{ name = "vsnip" },
		{ name = "buffer", keyword_length = 5 },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-f>"] = cmp.mapping.scroll_docs(-4),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})

local mason = require("mason")
mason.setup()

local mason_lspconfig = require("mason-lspconfig")
local lsp_config = require("lspconfig")
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
	function(server_name)
		lsp_config[server_name].setup({})
	end,
})

lsp_config.emmet_language_server.setup({})

local mason_null_ls = require("mason-null-ls")
mason_null_ls.setup({
	handlers = {},
	ensure_installed = {},
	automatic_installation = false,
})

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

local hover = require("hover")
hover.setup({
	init = function()
		-- Require providers
		require("hover.providers.lsp")
		-- require('hover.providers.gh')
		-- require('hover.providers.gh_user')
		-- require('hover.providers.jira')
		-- require('hover.providers.man')
		-- require('hover.providers.dictionary')
	end,
	preview_opts = {
		border = nil,
	},
	-- Whether the contents of a currently open hover window should be moved
	-- to a :h preview-window when pressing the hover keymap.
	preview_window = false,
	title = true,
})
