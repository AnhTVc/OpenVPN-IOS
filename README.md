openvpn-server-ios
==================

Tethering the hard way.

It turns out that Apple doesn't allow you to use `<net/if_utun.h>` unless you pay them a lot of money. Unfortunately you can't use [tunemu](https://github.com/friedrich/hans/blob/master/src/tunemu.c) either. 

Apple refuses to allow people to use the VPN framework unless they sign some sort of NDA: http://blog.michael.kuron-germany.de/2010/09/ios-4-1-undocumented-vpn-api-used-by-cisco-anyconnect/

## Setup

Install GNU libtool and automake:

	$ brew install libtool automake
	
Generate a static key and place it in `/configuration`: 

	$ openvpn --genkey --secret static.key
	
Build the dependencies:

    $ bash build-libssl.sh
    $ bash build-openvpn.sh
    
## Clean

To clean the `Submodules/openvpn` build folder:
	
	$ cd /Submodules/openvpn
    $ git clean -f && git clean -f -X
    
## Configuration

Simplest OpenVPN setup: [Static Key Mini-HOWTO](http://openvpn.net/index.php/open-source/documentation/miscellaneous/78-static-key-mini-howto.html)



