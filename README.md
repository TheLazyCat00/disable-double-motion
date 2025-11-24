# Disable Double Motion

This plugin simply frees various keybinds in o-pending for uses.

## Installation

lazy.nvim

```lua
{
	"TheLazyCat00/disable-double-motion",
	lazy = false,
	config = function(){
		require("disable-double-motion").disableDoubles()
	}
}
```
