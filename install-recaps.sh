#!/usr/bin/env sh

cat > /opt/recaps.sh <<EOF
#!/bin/sh

setkeycodes 0x3a 29
setkeycodes 0x1d 58
EOF

chmod a+x /opt/recaps.sh


cat > /etc/systemd/system/recaps.service <<EOF
[Unit]
Description=Swap Caps Lock and Left Control

[Service]
ExecStart=/opt/recaps.sh

[Install]
WantedBy=default.target
EOF

systemctl enable recaps
systemctl start recaps

