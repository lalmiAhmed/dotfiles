local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi

local uptime_text = wibox.widget.textbox()
uptime_text.align = "center"
uptime_text.valign = "center"
awful.widget.watch("uptime -p | sed 's/^...//'", 60, function(_, stdout)
    local out = stdout:gsub('^%s*(.-)%s*up', '%1')
    uptime_text.text = icons.uptime .. ' ' .. out
end)

local uptime_widget = wibox.widget {
    uptime_text,
    widget = wibox.container.background
}

return uptime_widget
