#!/bin/bash
status=$(cat /sys/class/power_supply/BAT0/status)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
notifed=$(cat ~/.config/polybar/forest/scripts/.Notifed)
if [[ $status == "Discharging" ]] && [[ $capacity == 20 ]] && [[ $notifed == "false" ]]; then
  rofi -theme ~/.config/polybar/forest/scripts/rofi/message.rasi -e "Turn On Your Charger :)
Less than 20% of battery remaining"
echo "true" >| .config/polybar/forest/scripts/.Notifed
elif [[ $status == "Charging" ]] || [[ $capacity != 20 ]]; then
  echo "false" >| .config/polybar/forest/scripts/.Notifed
fi
