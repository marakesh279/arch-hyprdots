#!/bin/bash

class=$(hyprctl -j activewindow | jq -r '.class // empty')


max_len=30
if [ ${#class} -gt $max_len ]; then
    class="${class:0:$max_len}…"
fi


echo "{\"text\": \"$class\"}"
