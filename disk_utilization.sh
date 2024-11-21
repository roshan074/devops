#!/bin/bash
THRESHOLD=80
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Disk usage is at ${USAGE}%, exceeding the threshold of ${THRESHOLD}%."
    # Send email (requires `mail` to be configured)
    echo "Disk usage critical: ${USAGE}%" | mail -s "Disk Utilization Alert" whoghostrider@gmail.com
else
    echo "Disk usage is under control: ${USAGE}%."
fi
