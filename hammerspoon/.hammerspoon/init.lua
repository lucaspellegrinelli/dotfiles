local function openApp(name)
    local script = [[
	tell application "]] .. name .. [["
	activate
	end tell
    ]]
    hs.applescript(script)
end

hs.hotkey.bind({ "ctrl" }, "2", function()
    openApp("Brave Browser")
end)

hs.hotkey.bind({ "ctrl" }, "3", function()
    openApp("kitty")
end)

hs.hotkey.bind({ "ctrl" }, "4", function()
    openApp("Slack")
end)

hs.hotkey.bind({ "ctrl" }, "5", function()
    openApp("Notes")
end)
