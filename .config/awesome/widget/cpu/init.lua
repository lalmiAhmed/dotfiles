local lain = require('lain')
local wibox = require('wibox')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local markup = lain.util.markup
local dpi = require('beautiful').xresources.apply_dpi

local glyph = wibox.widget.textbox()
glyph.font = beautiful.glyph_font .. ' 8'
glyph.align = 'center'
glyph.valign = 'center'
glyph.text = icons.cpu

local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. cpu_now.usage .. "%"))
    end
})

local cpu_widget = wibox.widget {
    glyph,
    cpu,
    layout = wibox.layout.fixed.horizontal
}

return wibox.container.margin(cpu_widget, dpi(4), dpi(4))
