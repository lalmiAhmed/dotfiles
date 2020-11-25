local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local dpi = require('beautiful').xresources.apply_dpi
local gears = require('gears')
local apps = require('configuration.apps')
local clickable_container = require('widget.material.clickable-container')

local buildButton = function(icon, name)
    local button_text = wibox.widget {
        text = icon,
        font = beautiful.glyph_font .. ' 16',
        align = 'center',
        valign = 'center',
        widget = wibox.widget.textbox
    }

    local a_button = wibox.widget {
        {
            button_text,
            margins = dpi(16),
            widget = wibox.container.margin
        },
        forced_width = dpi(60),
        forced_height = dpi(60),
        visible = true,
        widget = clickable_container
    }

    return wibox.widget {
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(5),
        a_button
    }
end

function suspend_command()
    awful.spawn.with_shell(apps.default.lock .. ' & systemctl suspend')
end
function exit_command()
    _G.awesome.quit()
end
function lock_command()
    awful.spawn.with_shell('sleep 1 && ' .. apps.default.lock)
end
function poweroff_command()
    awful.spawn.with_shell('poweroff')
end
function reboot_command()
    awful.spawn.with_shell('reboot')
end

local poweroff = buildButton(icons.power, 'Shutdown')
poweroff:connect_signal('button::release', function()
    poweroff_command()
end)

local reboot = buildButton(icons.restart, 'Restart')
reboot:connect_signal('button::release', function()
    reboot_command()
end)

local suspend = buildButton(icons.sleep, 'Sleep')
suspend:connect_signal('button::release', function()
    suspend_command()
end)

local exit = buildButton(icons.logout, 'Logout')
exit:connect_signal('button::release', function()
    exit_command()
end)

local lock = buildButton(icons.lock, 'Lock')
lock:connect_signal('button::release', function()
    lock_command()
end)

local power_options = wibox.widget {
    poweroff,
    reboot,
    suspend,
    exit,
    lock,
    layout = wibox.layout.fixed.horizontal
}

return power_options
