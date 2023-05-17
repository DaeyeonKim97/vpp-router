# check spec
uname -m
lspci | grep Ethernet

# install latest stable release (only https supported)
sudo mkdir -p /opt/trex
sudo cd /opt/trex
sudo wget --no-check-certificate --no-cache https://trex-tgn.cisco.com/trex/release/latest
sudo tar -xzvf latest
cd v3.02

# identify ports
sudo ./dpdk_setup_ports.py -s