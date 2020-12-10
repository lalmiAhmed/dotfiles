local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local dpi = require('beautiful').xresources.apply_dpi

local icon = wibox.widget {
    wibox.widget {
        image = icons.clock,
        widget = wibox.widget.imagebox
    },
    top = dpi(2),
    bottom = dpi(2),
    widget = wibox.container.margin
}

local time = wibox.widget.textclock('<span font="' .. beautiful.font .. '">%H:%M</span>')

local clock = wibox.widget {
    wibox.container.margin(time, dpi(2), dpi(2)),
    widget = wibox.container.background
}

local clock_widget = wibox.widget {
    icon,
    clock,
    layout = wibox.layout.align.horizontal
}

return wibox.container.margin(clock_widget, dpi(4), dpi(4))
