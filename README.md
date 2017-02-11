# OpenVPN-IOS
Build OpenVPN source for IOS to Wrapper Objective, run in IOS
Create by AnhTVc
# Step by step
# Install libtool and automake:

$ brew install libtool automake

# Build the dependencies:

$ bash build-libpcap.sh

$ bash build-libssl.sh

$ bash build-openvpn.sh

# Open project
Open OpenVPN project with Xcode
# Note
# error automake
If build error in cmd: "autoreconf -vi" SAME: Can't locate Autom4te/ChannelDefs.pm in @INC (you ma...

Fix: 

- rm '/usr/local/bin/autoconf'

- brew link --overwrite autoconf

- brew link --overwrite --dry-run autoconf

# Disable Bitcode
# Apple NDA
Apple refuses to allow people to use the VPN framework unless they sign some sort of NDA: http://blog.michael.kuron-germany.de/2010/09/ios-4-1-undocumented-vpn-api-used-by-cisco-anyconnect/

OpenVPN Connect sign NDA with apple because it not public.
