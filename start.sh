#!/bin/bash

cat >/etc/ppp/pppoe-server-options <<-EOF
ms-dns ${PPPOE_DNS1:-119.29.29.29}
ms-dns ${PPPOE_DNS2:-114.114.114.114}
auth
proxyarp
lcp-echo-interval 30
lcp-echo-failure 4
debug 1
logfile /var/log/pppd.log
EOF

cat >/etc/ppp/chap-secrets <<-EOF
"pppoe" * "pppoe" *
EOF

sleep 5
pppoe-server -I "${PPPOE_IFACE:-eth1}" -L "${PPPOE_LOCAL:-11.11.11.1}" -R "${PPPOE_REMOTE:-11.11.11.11}" -N "${PPPOE_NUM:-100}"

subn=$(printf "%s" "${PPPOE_REMOTE:-11.11.11.11}"|sed 's/[0-9]\+$/0/g')
iptables -A POSTROUTING -t nat -s "$subn/24" -j MASQUERADE

touch /var/log/pppd.log
tail -f /var/log/pppd.log
