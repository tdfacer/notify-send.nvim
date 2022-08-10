local notify_send = {}

local setup = function(opts)
  notify_send.notify_binary = opts.notify_binary and opts.notify_binary or "notify-send"
  return notify_send
end
notify_send.setup = setup

local remind = function()
  local title = vim.fn.input("Reminder title? ")
  local body = vim.fn.input("Reminder body? ")
  local when = vim.fn.input("Remind when? ")
  local command = string.format("echo '%s \"%s\" \"%s\"' | at %s &>/dev/null", notify_send.notify_binary, title, body,
    when)
  print(command)
  os.execute(command)
end
notify_send.remind = remind

local schedule = function()
  local binary = vim.fn.input("binary? ")
  local arguments = vim.fn.input("arguments? ")
  local when = vim.fn.input("When? ")
  local command = string.format("echo '%s \"%s\"' | at %s &>/dev/null", binary, arguments, when)
  print(command)
  os.execute(command)
end
notify_send.schedule = schedule

return notify_send
