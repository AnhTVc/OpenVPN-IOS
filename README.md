# OpenVPN-IOS
Build OpenVPN source for IOS to Wrapper Objective, run in IOS
Create by AnhTVc
# Step by step
# Clone
$ git clone https://github.com/AnhTVc/OpenVPN-IOS.git

$ cd OpenVPN-IOS/Submodules

$ git clone https://github.com/chrisballinger/hans/tree/893ac91eaf080b43170b839b22f9086f0dbc648d

$ git clone https://github.com/chrisballinger/openvpn/tree/0f77573024e69c34ec8a5cbc0744e126ad73de27

# Install libtool and automake:

$ brew install libtool automake

# Build the dependencies:

$ bash build-libpcap.sh

$ bash build-libssl.sh

$ bash build-openvpn.sh
# clone source hans and openvpn to Submodules. 

Link source

https://github.com/chrisballinger/hans/tree/893ac91eaf080b43170b839b22f9086f0dbc648d

https://github.com/chrisballinger/openvpn/tree/0f77573024e69c34ec8a5cbc0744e126ad73de27
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

Document for NDA OpenVPN with apple

https://books.google.com.vn/books?id=O-13CgAAQBAJ past: OpenVPN/OpenVPN Conenct

https://forums.openvpn.net/viewtopic.php?t=21218 

Contact me: tranvietanh.hust@gmail.com
