local awful = require('awful')
local beautiful = require('beautiful')
local clickable_container = require('widget.material.clickable-container')
local mat_icon_button = require('widget.material.icon-button')
local wibox = require('wibox')
local TagList = require('widget.tag-list')
local TaskList = require('widget.task-list')
local gears = require('gears')
local icons = require('theme.icons')
local dpi = require('beautiful').xresources.apply_dpi
local theme = require('theme')

local separator = wibox.widget {
    text = icons.separator,
    font = theme.glyph_font .. ' 10',
    opacity = 0.5,
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local TopBar = function(s, offset)

    -- LAYOUT BOX
    -- ==========
    local LayoutBox = require('widget.layoutbox')

    -- BATTERY
    -- =======
    local battery_widget = require('widget.battery')

    -- SYSTEM TRAY
    -- ===========
    local systray = wibox.widget.systray()
    systray:set_horizontal(true)

    -- TASK LIST
    -- =========
    local task_list = wibox.widget {
        separator,
        TaskList(s),
        separator,
        layout = wibox.layout.align.horizontal
    }

    -- SYSTEM DETAILS
    -- ==============
    local volume_widget = require('widget.volume.volume-percentage')
    local date_widget = require('widget.date')
    local clock_widget = require('widget.clock')
    local system_details = wibox.widget {
        wibox.widget {
            volume_widget,
            separator,
            date_widget,
            separator,
            clock_widget,
            layout = wibox.layout.fixed.horizontal
        },
        bg = beautiful.primary.hue_800,
        widget = wibox.container.background
    }

    local calendar = require('widget.calendar')
    calendar:attach(date_widget)

    -- TOP BAR
    -- =======
    local panel = wibox({
        ontop = false,
        screen = s,
        height = dpi(32),
        width = s.geometry.width,
        x = s.geometry.x,
        y = s.geometry.y,
        stretch = false,
        bg = beautiful.primary.hue_900,
        fg = beautiful.fg_normal
    })

    panel:struts({
        top = dpi(32)
    })

    panel:setup{
        layout = wibox.layout.align.horizontal,
        spacing = dpi(0),
        TagList(s),
        task_list,
        wibox.widget {
            wibox.container.margin(systray, dpi(4), dpi(4), dpi(4), dpi(4)),
            battery_widget,
            wibox.container.margin(system_details, dpi(2), dpi(2), dpi(5), dpi(5)),
            LayoutBox(s),
            layout = wibox.layout.fixed.horizontal
        }
    }

    return panel
end

return TopBar
