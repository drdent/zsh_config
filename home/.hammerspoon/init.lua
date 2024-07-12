---- Global
local log = hs.logger.new('zsh_config','debug')

---- ClipboardTool
--hs.loadSpoon("ClipboardTool")
local cliboardtool_hotkeys = {
  show_clipboard = {{"cmd", "shift"}, "v"}
}
--spoon.ClipboardTool:bindHotkeys(cliboardtool_hotkeys)
--spoon.ClipboardTool.show_in_menubar = false
--spoon.ClipboardTool:start()

---- Screen / Window movement
local primaryDisplayname = "Color LCD"
local primaryDisplay = hs.screen.find(primaryDisplayname)
local secondaryDisplayname = "DELL U2715H"
local secondaryDisplayMode = { w = 2560, h = 1440 }
local secondaryDisplay = hs.screen.find(secondaryDisplayname)

if not not secondaryDisplay then
  secondaryScreenFrame = secondaryDisplay:frame()
end

-- config
hs.window.animationDuration = 0

-- 2/3 screen size, anchor top left, screen 1
hs.hotkey.bind({"cmd", "shift"}, "1", function()
  local focusedWindow = hs.window.focusedWindow()
  focusedWindow:move({x = 0, y = 0, w = 0.66, h = 1}, primaryDisplay)
end)

-- 1/3 screen size, anchor at 2/3 width, screen 1
hs.hotkey.bind({"cmd", "shift"}, "2", function()
  local focusedWindow = hs.window.focusedWindow()
  focusedWindow:move({x = 0.66, y = 0, w = 0.34, h = 1}, primaryDisplay)
end)

-- 2/3 screen size, anchor top left, screen 2
hs.hotkey.bind({"cmd", "shift"}, "3", function()
  local focusedWindow = hs.window.focusedWindow()
  focusedWindow:move({x = secondaryScreenFrame.x, y = 0, w = (secondaryScreenFrame.w / 3) * 2, h = secondaryScreenFrame.h}, secondaryDisplay)
end)

-- 1/3 screen size, anchor top right, screen 2
hs.hotkey.bind({"cmd", "shift"}, "4", function()
  local focusedWindow = hs.window.focusedWindow()
  focusedWindow:move({x = secondaryScreenFrame.x + secondaryScreenFrame.w / 3, y = 0, w = (secondaryScreenFrame.w / 3), h = secondaryScreenFrame.h}, secondaryDisplay)
end)

-- full size on current window
hs.hotkey.bind({"cmd", "shift"}, "0", function()
  local focusedWindow = hs.window.focusedWindow()
  focusedWindow:move({x = 0, y = 0, w = 1, h = 1})
end)
-- Standard layout
hs.hotkey.bind({"cmd", "shift"}, "9", function()
  local windowLayout = {
    {"Google Chrome", nil, secondaryDisplay, { x = 0, y = 0, w = 0.66, h = 1}, nil, nil},
    {"Firefox", nil, secondaryDisplay, { x = 0, y = 0, w = 0.66, h = 1}, nil, nil},
    {"RubyMine", nil, secondaryDisplay, { x = 0, y = 0, w = 0.66, h = 1}, nil, nil},
    {"Atom", nil, secondaryDisplay, { x = 0, y = 0, w = 0.66, h = 1}, nil, nil},
    {"iTerm2", nil, secondaryDisplay, { x = 0.66, y = 0, w = 0.34, h = 1}, nil, nil},
    {"Microsoft Outlook", nil, primaryDisplay, { x = 0, y = 0, w = 0.66, h = 1}, nil, nil},
    {"Mattermost", nil, primaryDisplay, { x = 0.66, y = 0, w = 0.34, h = 1}, nil, nil},
    {"Amazon Music", nil, primaryDisplay, { x = 0, y = 0, w = 1, h = 1}, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)
