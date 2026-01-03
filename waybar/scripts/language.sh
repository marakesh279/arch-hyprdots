#!/bin/bash

# Получаем текущий layout клавиатуры через sway/hyprctl
layout=$(swaymsg -t get_inputs | jq -r '.[] | select(.type=="keyboard").xkb_active_layout_name' | head -n1)

# Приводим к US/RU
case "$layout" in
    "us"|"US")
        layout="US"
        ;;
    "ru"|"RU")
        layout="RU"
        ;;
    *)
        layout="??"
        ;;
esac

# Вывод JSON для Waybar
echo "{\"text\": \"$layout\"}"
