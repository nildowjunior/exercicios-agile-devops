ip netns del green
ip netns del yellow
ip link del v-net-0
iptables -t nat -D POSTROUTING 1
