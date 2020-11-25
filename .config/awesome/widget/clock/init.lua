local wibox = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')
local dpi = require('beautiful').xresources.apply_dpi

local clock = wibox.widget.textclock('<span font="' .. beautiful.glyph_font .. '">  </span><span font="' ..
                                         beautiful.font .. '">%H:%M</span>')

local clock_widget = wibox.widget {
    wibox.container.margin(clock, dpi(6), dpi(6)),
    bg = beautiful.primary.hue_800,
    widget = wibox.container.background
}

return clock_widget
