local awful = require('awful')
local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi
local clickable_container = require('widget.material.clickable-container')

local LayoutBox = function(s)
    local layoutBox = clickable_container(wibox.widget {
        (awful.widget.layoutbox(s)),
        margins = dpi(4),
        widget = wibox.container.margin
    })
    layoutBox:buttons(awful.util.table.join(awful.button({}, 1, function()
        awful.layout.inc(1)
    end), awful.button({}, 3, function()
        awful.layout.inc(-1)
    end), awful.button({}, 4, function()
        awful.layout.inc(1)
    end), awful.button({}, 5, function()
        awful.layout.inc(-1)
    end)))
    return layoutBox
end

return LayoutBox
