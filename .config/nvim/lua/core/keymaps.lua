vim.g.mapleader = " "
local keymap = vim.keymap

-- function replace_tab_w_space()
--     local current_view = vim.fn.winsaveview()
--     vim.cmd([[%s/\t/    /g]])
--     vim.fn.winrestview(current_view)
-- end

keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- keymap.set("n", "<leader>ts", "<cmd>lua replace_tab_w_space()<CR>", { desc = "Replace tab with spaces" })
