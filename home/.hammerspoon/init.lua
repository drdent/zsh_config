hs.loadSpoon("ClipboardTool")
local cliboardtool_hotkeys = { 
  show_clipboard = {{"cmd", "shift"}, "v"}
}
spoon.ClipboardTool:bindHotkeys(cliboardtool_hotkeys)
spoon.ClipboardTool.show_in_menubar = false
spoon.ClipboardTool:start()
