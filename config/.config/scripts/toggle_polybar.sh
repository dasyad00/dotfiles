#!/bin/sh
bar_size=42
current_padding=$(bspc config -m focused top_padding)
new_padding=0
if [ "${current_padding}" == "${bar_size}"  ]; then
    # Remove padding
    new_padding=0
else
    # Add padding
    new_padding=${bar_size}
fi
polybar-msg cmd toggle

echo ${new_padding}
bspc config -m focused top_padding ${new_padding}
