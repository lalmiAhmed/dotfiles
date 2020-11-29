local awful = require("awful")
local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local dpi = require('beautiful').xresources.apply_dpi
local watch = require('awful.widget.watch')
local beautiful = require('beautiful')
local icons = require('theme.icons')

local glyph = wibox.widget.textbox()
glyph.font = beautiful.glyph_font
glyph.align = 'center'
glyph.valign = 'center'
glyph.text = icons.volume

local percentage = wibox.widget.textbox()
percentage.align = 'center'
percentage.valign = 'center'
percentage.font = beautiful.font

local volume

function update_volume()
    awful.spawn.easy_async_with_shell("bash -c 'amixer -D pulse sget Master'", function(stdout)
        volume = string.match(stdout, '(%d?%d?%d)%%')
        awful.spawn.easy_async_with_shell("bash -c 'pacmd list-sinks | awk '/muted/ { print $2 }''", function(muted)
            muted = string.gsub(muted, "%s+", "")
            if volume == '0' then
                glyph.text = ''
            elseif muted == 'muted:no' then
                glyph.text = ''
            elseif muted == 'muted:yes' then
                glyph.text = ''
            end
        end)
        percentage.text = volume
        collectgarbage('collect')
    end)
end

update_volume()

local volume_percentage = wibox.widget {
    glyph,
    wibox.container.margin(percentage, dpi(4)),
    layout = wibox.layout.fixed.horizontal
}

local volume_widget = wibox.widget {
    wibox.container.margin(volume_percentage, dpi(6), dpi(6)),
    widget = wibox.container.background
}

return volume_widget
