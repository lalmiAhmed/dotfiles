local wibox = require('wibox')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local dpi = require('beautiful').xresources.apply_dpi
local watch = require('awful.widget.watch')

local icon = wibox.widget {
    wibox.widget {
        image = icons.memory,
        widget = wibox.widget.imagebox
    },
    top = dpi(3),
    bottom = dpi(3),
    widget = wibox.container.margin
}

local memory = wibox.widget.textbox()

watch('bash -c "free | grep -z Mem.*Swap.*"', 1, function(_, stdout)
    local total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap =
        stdout:match('(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*Swap:%s*(%d+)%s*(%d+)%s*(%d+)')

    memory.text = math.floor(used / 100) .. 'MB'
    collectgarbage('collect')
end)

local mem_widget = wibox.widget {
    icon,
    wibox.container.margin(memory, dpi(4), dpi(4), dpi(4), dpi(4)),
    layout = wibox.layout.fixed.horizontal
}

return wibox.container.margin(mem_widget, dpi(4), dpi(4))
