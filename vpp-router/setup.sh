# systemctl vpp stop
sudo -s
systemctl stop vpp

# pci check
pci=$(sudo lshw -class network -businfo | awk '/virtio@1/{print prev} {prev=$0}' | awk '{gsub(/[^0-9:.]/,"",$1); print $1}')
echo $pci

# ip link down
ip link
ip link set eth1 down

# vpp start (with startup.conf)
vpp -c /etc/vpp/startup.conf