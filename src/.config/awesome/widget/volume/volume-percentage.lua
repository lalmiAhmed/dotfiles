local awful = require("awful")
local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local dpi = require('beautiful').xresources.apply_dpi
local watch = require('awful.widget.watch')
local beautiful = require('beautiful')
local icons = require('theme.icons')

local glyph = wibox.widget.imagebox(icons.volume)
local icon = wibox.widget {
    glyph,
    top = dpi(1),
    bottom = dpi(1),
    widget = wibox.container.margin
}

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
                glyph.image = icons.volume_mute
            elseif muted == 'muted:no' then
                glyph.image = icons.volume
            elseif muted == 'muted:yes' then
                glyph.image = icons.volume_mute
            end
        end)
        percentage.text = volume
        collectgarbage('collect')
    end)
end

update_volume()

local volume_percentage = wibox.widget {
    icon,
    wibox.container.margin(percentage, dpi(4)),
    layout = wibox.layout.fixed.horizontal
}

local volume_widget = wibox.widget {
    wibox.container.margin(volume_percentage, dpi(6), dpi(6)),
    widget = wibox.container.background
}

return volume_widget
