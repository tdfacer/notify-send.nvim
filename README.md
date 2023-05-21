# notify-send.nvim

This plugin supports scheduling using `notify-send`. Only linux systems have been tested.

## Setup

```
local notify_send = require("notify-send").setup({
  notify_binary = "<path_to_binary>"
})
```

*Example*

```
local notify_send = require("notify-send").setup({
  notify_binary = "/usr/bin/notify-send"
})
```

## Usage

### Keymaps

```
-- (R)emind
vim.keymap.set("n", "<leader><leader>R", notify_send.remind, opts)

-- (S)chedule
vim.keymap.set("n", "<leader><leader>S", notify_send.schedule, opts)
```

## Example

![](https://www.trevorfacer.com/nvim-send.gif)
