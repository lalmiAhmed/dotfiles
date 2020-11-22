local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')

return wibox.widget {
    require('widget.volume.volume-slider'),
    require('widget.brightness.brightness-slider'),
    layout = wibox.layout.fixed.vertical
}
