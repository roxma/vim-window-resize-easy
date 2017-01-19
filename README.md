# vim-window-resize-easy

This is a very simple plugin that hacks vim's builtin window resizing keys,
inspired by tmux's window resizing keys.

Normally when you need to decrease vim's window horizontally, you may need to
press `<c-w><` `<c-w><` `<c-w><` ...

With vim-window-resize-easy, after pressing `<c-w><`, you only need to repeat
the action with `<` `<` `<`. If you don't press any key in 2 seconds, it
returns to normal mode automatically.

## Keys supported in resizing mode:

There're all builtin keys combined with `<c-w>` for window resizing on vim. 
Type `:help resize` for more information.

- `<` horizontal smaller
- `>` horizontal greater
- `-` vertical decrease
- `+` vertical increase
- `=` equalize
- `_` maximize
- `|` vertical maximize

## Requirement

- vim 7.4.1952+ or neovim (with timers support)

Happy editting!

