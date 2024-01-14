return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-M-n>", ":Neotree toggle left<CR>")
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
		require("neo-tree").setup({
			window = {
				position = "left",
				width = 35,
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
				}
			},
		})
	end
}
