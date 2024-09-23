#!/bin/bash
 
lock=" Bloquejar"
logout=" Tancar sessió"
shutdown="襤 Apagar"
reboot=" Reinciar"
sleep=" Suspensió"
 
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu -i -p "Menú d'apagada" \
		  -theme "~/.config/rofi/powermenu2.rasi")

if [ "$selected_option" == "$lock" ]
then
  hyprlock
elif [ "$selected_option" == "$logout" ]
then
  hyprctl dispatch exit
elif [ "$selected_option" == "$shutdown" ]
then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
  systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
  systemctl suspend
else
  echo "No match"
fi
