# Sixty

Neovim plugin that ignores arrow keys and
reminds to use a 60% keyboard layout.

## About

Remaps following keys to `<Nop>` as well notifying user to use 60% layout keys:

```lua
vim.keymap.set(
  "{n,i,v,c}",
  "{<Up>,<Down>,<Left>,<Right>}",
  notifications.notify_arrow_usage,
  { remap = false, silent = true }
)
```

Also enables *tcsh-style* command line controls:

```lua
vim.keymap.set("c", "<C-A>", "<Home>", { remap = false })
vim.keymap.set("c", "<C-F>", "<Right>", { remap = false })
vim.keymap.set("c", "<C-B>", "<Left>", { remap = false })
```

## Credits

Orlova Vasilisa Mikhailovna - M3104