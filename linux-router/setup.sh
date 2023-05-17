sudo sysctl -w net.ipv4.ip_forward=1
sudo ip route add 10.10.0.0/24 via 10.1.2.1 dev eth0
sudo ip route add 10.20.0.0/24 via 10.1.2.1 dev eth0