local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Space>pp', builtin.find_files, {})
vim.keymap.set('n', '<Space>pf', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
-- vim.keymap.set('n', '<C-S-F>', builtin.find_files, {})
-- NOTE(Jovan): Use vim.keymap.set('n', '<C-S-F>', builtin.git_files, {}) to search only git visible files
