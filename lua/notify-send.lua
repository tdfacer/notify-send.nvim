local notify_send = {}
local api = vim.api

local setup = function(opts)
  notify_send.notify_binary = opts.notify_binary and opts.notify_binary or "notify-send"
  return notify_send
end
notify_send.setup = setup

local schedule_line = function()
  local win_id = api.nvim_get_current_win()
  local bufnr = api.nvim_win_get_buf(win_id)
  local cursor_position = api.nvim_win_get_cursor(win_id)
  local row = cursor_position[1]
  local current_line_text_table = api.nvim_buf_get_text(bufnr, row - 1, 0, row - 1, -1, {})
  local current_line_text = current_line_text_table[1]
  local when = vim.fn.input("Remind '" .. current_line_text .. "' when? ")
  local command = string.format("echo '%s \"%s\" \"%s\" &>/tmp/notify-send-lua-remind-out.txt' | at %s &>/dev/null",
    notify_send.notify_binary, "Reminder", current_line_text, when)
  print(command)
  os.execute(command)
end
notify_send.schedule_line = schedule_line

local remind = function()
  local title = vim.fn.input("Reminder title? ")
  local body = vim.fn.input("Reminder body? ")
  local when = vim.fn.input("Remind when? ")
  local command = string.format("echo '%s \"%s\" \"%s\" &>/tmp/notify-send-lua-remind-out.txt' | at %s &>/dev/null",
    notify_send.notify_binary, title, body,
    when)
  print(command)
  os.execute(command)
end
notify_send.remind = remind

local schedule = function()
  local binary = vim.fn.input("binary? ")
  local arguments = vim.fn.input("arguments? ")
  local when = vim.fn.input("When? ")
  local command = string.format("echo '%s \"%s\" &>/tmp/notify-send-lua-schedule-out.txt' | at %s &>/dev/null", binary,
    arguments,
    when)
  print(command)
  os.execute(command)
end
notify_send.schedule = schedule

return notify_send
