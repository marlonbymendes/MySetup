#!/bin/bash

# Toggles touchpad on/off
# It is recommended you add a shortcut for this script

notify_touchpad_toggle() {
    notify-send -t 2220 Touchpad $1
}

if synclient | grep -i --quiet 'TouchpadOff             = 0'; then
  synclient TouchpadOff=1
#  notify-send Touchpad Disabled
  notify_touchpad_toggle "Disabled"
else
  synclient TouchpadOff=0
  notify_touchpad_toggle "Enabled"
fi
