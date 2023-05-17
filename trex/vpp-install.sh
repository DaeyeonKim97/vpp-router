sudo yum update
sudo yum install pygpgme yum-utils

sudo cat << EOF > /etc/yum.repos.d/fdio-release.repo
[fdio_release]
name=fdio_release
baseurl=https://packagecloud.io/fdio/release/el/7/centos
repo_gpgcheck=1
gpgcheck=0
enabled=1
gpgkey=https://packagecloud.io/fdio/release/gpgkey
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
metadata_expire=300

[fdio_release-source]
name=fdio_release-source
baseurl=https://packagecloud.io/fdio/release/el/7/SRPMS
repo_gpgcheck=1
gpgcheck=0
enabled=1
gpgkey=https://packagecloud.io/fdio/release/gpgkey
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
metadata_expire=300
EOF

sudo yum clean all
sudo yum -q makecache -y --disablerepo='*' --enablerepo='fdio_release'

sudo yum --showduplicates list vpp* | expand

sudo yum clean all
sudo yum -q makecache -y --disablerepo='*' --enablerepo='fdio_master'

sudo yum install vpp
sudo yum install vpp-plugins vpp-devel vpp-api-python vpp-api-lua vpp-api-java vpp-debuginfo vpp-devel libvpp0