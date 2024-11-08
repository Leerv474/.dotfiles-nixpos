return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.keymap.set("n", "<leader>e", function()
			vim.cmd.NvimTreeToggle()
		end, { desc = "Toggle file tree" })

		require("nvim-tree").setup({
			hijack_netrw = true,
			auto_reload_on_write = true,
			notify = {
				threshold = vim.log.levels.ERROR,
			},
			renderer = {
				group_empty = true,
			},
			view = {
				width = 40,
			},
			actions = {
				open_file = {
					quit_on_open = false,
				},
			},
			diagnostics = {
				enable = false,
			},
			log = {
				enable = false,
			},
		})
		vim.o.confirm = true

		vim.api.nvim_create_autocmd("QuitPre", {
			callback = function()
				local invalid_win = {}
				local wins = vim.api.nvim_list_wins()
				for _, w in ipairs(wins) do
					local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
					if bufname:match("NvimTree_") ~= nil then
						table.insert(invalid_win, w)
					end
				end
				if #invalid_win == #wins - 1 then
					for _, w in ipairs(invalid_win) do
						vim.api.nvim_win_close(w, true)
					end
				end
			end,
		})
	end,
}
