local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')
local dpi = require('beautiful').xresources.apply_dpi

local date = wibox.widget.textclock('<span font="' .. beautiful.glyph_font .. '"> </span><span font="' ..
                                        beautiful.font .. '">%d/%m</span>')

local screen = awful.screen.focused()
local date_widget = wibox.widget {
    wibox.container.margin(date, dpi(6), dpi(6)),
    x = screen.geometry.width - dpi(96),
    y = 0,
    widget = wibox.container.background
}

return date_widget
