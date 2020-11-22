local theme = require('theme')
local wibox = require('wibox')
local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons'

local separator = wibox.widget {
    text = '|',
    font = theme.glyph_font,
    widget = wibox.widget.textbox
}

return {
    -- Image based
    menu = dir .. '/dashboard.svg',
    close = dir .. '/close.svg',
    close_dark = dir .. '/close_dark.svg',
    logout = dir .. '/logout.svg',
    sleep = dir .. '/power-sleep.svg',
    power = dir .. '/power.svg',
    lock = dir .. '/lock.svg',
    restart = dir .. '/restart.svg',
    search = dir .. '/magnify-dark.svg',
    volume = dir .. '/volume-high.svg',
    volume_dark = dir .. '/volume-high-dark.svg',
    brightness = dir .. '/brightness-7.svg',
    chart = dir .. '/chart-areaspline.svg',
    memory = dir .. '/memory.svg',
    harddisk = dir .. '/harddisk.svg',
    thermometer = dir .. '/thermometer.svg',
    uptime = dir .. '/computer.svg',

    -- Others
    separator = separator
}
