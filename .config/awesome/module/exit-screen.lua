local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local clickable_container = require('widget.material.clickable-container')
local apps = require('configuration.apps')
local dpi = require('beautiful').xresources.apply_dpi

-- Appearance
local icon_size = beautiful.exit_screen_icon_size or dpi(140)

local buildButton = function(icon)
    local button_text = wibox.widget {
        text = icon,
        font = beautiful.glyph_font .. ' 32',
        align = 'center',
        valign = 'center',
        widget = wibox.widget.textbox
    }

    local a_button = wibox.widget {
        {
            button_text,
            margins = dpi(32),
            widget = wibox.container.margin
        },
        shape = gears.shape.circle,
        visible = true,
        widget = clickable_container
    }

    return wibox.widget {
        layout = wibox.layout.flex.horizontal,
        spacing = dpi(64),
        a_button
    }
end

function suspend_command()
    exit_screen_hide()
    awful.spawn.with_shell(apps.default.lock .. ' & systemctl suspend')
end
function exit_command()
    _G.awesome.quit()
end
function lock_command()
    exit_screen_hide()
    awful.spawn.with_shell('sleep 1 && ' .. apps.default.lock)
end
function poweroff_command()
    awful.spawn.with_shell('poweroff')
    awful.keygrabber.stop(_G.exit_screen_grabber)
end
function reboot_command()
    awful.spawn.with_shell('reboot')
    awful.keygrabber.stop(_G.exit_screen_grabber)
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

-- Get screen geometry
local screen_geometry = awful.screen.focused().geometry

-- Create the widget
exit_screen = wibox({
    x = screen_geometry.x,
    y = screen_geometry.y,
    visible = false,
    ontop = true,
    type = 'splash',
    height = screen_geometry.height,
    width = screen_geometry.width
})

exit_screen.bg = beautiful.primary.hue_900 .. '55'

local exit_screen_grabber

function exit_screen_hide()
    awful.keygrabber.stop(exit_screen_grabber)
    exit_screen.visible = false
end

function exit_screen_show()
    exit_screen_grabber = awful.keygrabber.run(function(_, key, event)
        if event == 'release' then
            return
        end

        if key == 's' then
            suspend_command()
        elseif key == 'e' then
            exit_command()
        elseif key == 'l' then
            lock_command()
        elseif key == 'p' then
            poweroff_command()
        elseif key == 'r' then
            reboot_command()
        elseif key == 'Escape' or key == 'q' or key == 'x' then
            exit_screen_hide()
        end
    end)
    exit_screen.visible = true
end

exit_screen:buttons(gears.table.join( -- Middle click - Hide exit_screen
awful.button({}, 2, function()
    exit_screen_hide()
end), awful.button({}, 3, function()
    exit_screen_hide()
end)))

-- Item placement
exit_screen:setup{
    nil,
    {
        nil,
        {
            poweroff,
            reboot,
            suspend,
            exit,
            lock,
            layout = wibox.layout.fixed.horizontal
        },
        nil,
        expand = 'none',
        layout = wibox.layout.align.horizontal
    },
    nil,
    expand = 'none',
    layout = wibox.layout.align.vertical
}
