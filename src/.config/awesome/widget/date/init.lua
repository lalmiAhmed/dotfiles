local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local dpi = require('beautiful').xresources.apply_dpi

local icon = wibox.widget {
    wibox.widget {
        image = icons.calendar,
        widget = wibox.widget.imagebox
    },
    top = dpi(2),
    bottom = dpi(2),
    widget = wibox.container.margin
}

local date_text = wibox.widget.textclock('<span font="' .. beautiful.font .. '">%d/%m</span>')

local date = wibox.widget {
    wibox.container.margin(date_text, dpi(2), dpi(2)),
    widget = wibox.container.background
}

local date_widget = wibox.widget {
    icon,
    date,
    layout = wibox.layout.align.horizontal
}

return wibox.container.margin(date_widget, dpi(4), dpi(4))
