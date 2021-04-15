#!/bin/bash

telegram_bot_token="1708336602:AAG00r-1R3h53cC6WeHJpZ_a3aNwBQy4-zw"
telegram_chat_id="@misterobots"

Title="$1"
Message="$2"

curl -s \
 --data parse_mode=HTML \
 --data chat_id=${telegram_chat_id} \
 --data text="<b>${Title}</b>%0A${Message}" \
 --request POST https://api.telegram.org/bot${telegram_bot_token}/sendMessage
