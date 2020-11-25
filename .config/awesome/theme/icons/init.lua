local theme = require('theme')
local wibox = require('wibox')
local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons'

return {
    -- Image based
    chart = dir .. '/chart-areaspline.svg',
    harddisk = dir .. '/harddisk.svg',
    memory = dir .. '/memory.svg',
    thermometer = dir .. '/thermometer.svg',

    -- Text based
    brightness = '',
    close = '',
    lock = '',
    logout = '',
    menu = '',
    mute = '',
    power = '',
    restart = '',
    search = '',
    separator = '|',
    sleep = '',
    uptime = '',
    volume = ''
}
