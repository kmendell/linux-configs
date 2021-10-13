local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'alacritty',
    browser = 'firefox',
    editor = 'gedit', -- gui text editor
    files = 'nautilus'
  },
  
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom --config ~/.config/awesome/configuration/picom.conf',
    'nm-applet --indicator', -- wifi
    'pnmixer',
    'feh --randomize --recursive --bg-fill ~/wallpapers/wallpapers*',
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
