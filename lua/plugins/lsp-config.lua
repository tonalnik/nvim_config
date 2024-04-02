return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				-- без этого не работает на windows
				cmd = { "lua-language-server.cmd" }
			})
			lspconfig.tsserver.setup({
				-- без этого не работает на windows
				cmd = { "typescript-language-server.cmd", "--stdio" },
				detached = false
			})

			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
			vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {})
			-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
		end
	}
}

