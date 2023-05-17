# clone vpp repository
git clone https://github.com/FDio/vpp.git
cd vpp

# install build-essential
sudo apt install build-essential

# make dependencies
sudo make install-deps
sudo make install-ext-deps

# configure ninja build
./configure

# build, install and create deb package file with ninja
sudo ninja 
sudo ninja install
sudo ninja pkg-deb

# install with `.deb` files
dpkg -i libvppinfra_22.02-release_amd64.deb
dpkg -i vpp_22.02-release_amd64.deb
dpkg -i vpp-plugin-core_22.02-release_amd64.deb
dpkg -i vpp-plugin-devtools_22.02-release_amd64.deb
dpkg -i vpp-plugin-dpdk_22.02-release_amd64.deb

# start with start.conf
./vpp -c ../vpp/startup.conf