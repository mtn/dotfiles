local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', function() builtin.find_files({ hidden = true }) end, {})
vim.keymap.set('n', '<C-l>', function() builtin.git_files({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("grep > ") });
end)
