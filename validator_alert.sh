#!/bin/bash

telegram_bot_token="1760623485:AAHOO9P4KvR16UpH6cwWaf8263hORr6y4JM"
telegram_chat_id="@misterobots"

Title="$1"
Message="$2"

curl -s \
 --data parse_mode=HTML \
 --data chat_id=${telegram_chat_id} \
 --data text="<b>${Title}</b>%0A${Message}" \
 --request POST https://api.telegram.org/bot${telegram_bot_token}/sendMessage
