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
glyph.text = icons.memory

local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. mem_now.used .. "MB"))
    end
})

local mem_widget = wibox.widget {
    glyph,
    mem,
    layout = wibox.layout.fixed.horizontal
}

return wibox.container.margin(mem_widget, dpi(4), dpi(4))
