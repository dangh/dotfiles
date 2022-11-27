local status, svart = pcall(require, 'svart')
if (not status) then return end

vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Cmd>Svart<CR>')        -- begin exact search
vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Cmd>SvartRegex<CR>')   -- begin regex search
vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Cmd>SvartRepeat<CR>') -- repeat with last searched query
