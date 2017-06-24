#!/bin/bash

echo "This will install ibus-avro on your system."

function install_avro()
{
	if [[ `arch` == *"$x86_84"* ]]; then
echo "Running in 64bit"
{
mkdir /tmp/insttools/ >/dev/null 2>&1
echo "done 1/7"
wget http://mirror.amberit.com.bd/debian/pool/main/i/im-config/im-config_0.29-1.4_all.deb -P /tmp/insttools/ >/dev/null 2>&1
wget http://download.opensuse.org/repositories/home:/sarimkhan/xUbuntu_14.04/amd64/ibus-avro-trusty_1.2_amd64.deb -P /tmp/insttools/ >/dev/null 2>&1
echo "done 2/7"
dpkg -i /tmp/insttools/im-config_0.29-1.4_all.deb >/dev/null 2>&1
echo "done 3/7"
dpkg -i /tmp/insttools/ibus-avro-trusty_1.2_amd64.deb >/dev/null 2>&1
echo "done 4/7"
apt install -f >/dev/null 2>&1
echo "done 5/7"
rm -rf /tmp/insttools/
echo "done 6/7"
loggeduser=`who -u | cut -d' ' -f1`
{
su "$loggeduser" <<'EOF'
im-config -n ibus
EOF
}
echo "done 7/7"
}
fi
	if [[ `arch` == *"i686"* ]]; then
echo "Running in 32 bit"
{
mkdir /tmp/insttools/ >/dev/null 2>&1
echo "done 1/7"
wget http://download.opensuse.org/repositories/home:/sarimkhan/xUbuntu_14.04/i386/ibus-avro-trusty_1.2_i386.deb -P /tmp/insttools/ >/dev/null 2>&1
wget http://mirror.amberit.com.bd/debian/pool/main/i/im-config/im-config_0.29-1.4_all.deb -P /tmp/insttools/ >/dev/null 2>&1
echo "done 2/7"
dpkg -i /tmp/insttools/im-config_0.29-1.4_all.deb >/dev/null 2>&1
echo "done 3/7"
dpkg -i /tmp/insttools/ibus-avro-trusty_1.2_i386.deb >/dev/null 2>&1
echo "done 4/7"
apt install -f >/dev/null 2>&1
echo "done 5/7"
rm -rf /tmp/insttools/
echo "done 6/7"
loggeduser=`who -u | cut -d' ' -f1`
{
su "$loggeduser" <<'EOF'
im-config -n ibus
EOF
}
echo "done 7/7"
}
fi
}
	if [ `id -u` -ne 0 ]; then
	echo "Plaese execute this script as root."
fi 
	if [ `id -u` -eq 0 ]; then 
install_avro
echo "You must log out and log back in to verify."
fi