local notify_send = require("notify-send").setup({
  notify_binary = "/usr/bin/notify-send"
})
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader><leader>R", notify_send.remind, opts)
vim.keymap.set("n", "<leader><leader>S", notify_send.schedule, opts)
vim.keymap.set("n", "<leader>Sr", notify_send.remind, opts)
vim.keymap.set("n", "<leader>Sj", notify_send.schedule, opts)
vim.keymap.set("n", "<leader>Sl", notify_send.schedule_line, opts)
