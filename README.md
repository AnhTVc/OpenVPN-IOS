# OpenVPN-IOS

![Platforms](https://img.shields.io/badge/iOS-9.0+-yellow.svg)
![iOS Versions](https://img.shields.io/badge/iOS-9.0+-yellow.svg)
![Xcode Version](https://img.shields.io/badge/Xcode-9.0+-yellow.svg)
![Carthage Compatible](https://img.shields.io/badge/Carthage-Compatible-4BC51D.svg?style=flat)
![License](https://img.shields.io/badge/License-AGPLv3-lightgrey.svg)

More Features
==================

OpenVPN-IOS is an Objective-C project that allows to easily configure and establish VPN connection using OpenVPN protocol. It is based on the original openvpn3 library so it has every feature the library has.

The project is designed to use in conjunction with NetworkExtension framework and doesn't use any private Apple API. 

Support .mobileconfig sample openvpn connect app: https://openvpn.net/faq/can-i-import-an-openvpn-profile-via-an-ios-mobileconfig-file/

## Download full source

Download [here](https://drive.google.com/file/d/1E5EOwbE-dcdLFkcSBgZljTm17BwXmjHy/view?usp=sharing)

## Demo 
I complete integrate openvpn with NetworkExtension: 

Video demo in [here](https://drive.google.com/file/d/1jwat_eNcsQt519YhDbcklLpl97XmENNX/view?usp=sharing) 

Video demo work with [.mobileconfig](https://drive.google.com/file/d/1GJsVlJCRozZeYQT5uPMDVY-YI9F6br7h/view?usp=sharing)
## Setup

Install GNU libtool and automake:

	$ brew install libtool automake
	
Generate a static key and place it in `/configuration`: 

	$ openvpn --genkey --secret static.key
	
Build the dependencies:

    $ bash build-libssl.sh
    $ bash build-openvpn.sh

clone source hans and openvpn to Submodules.Link source

https://github.com/chrisballinger/hans/tree/893ac91eaf080b43170b839b22f9086f0dbc648d

https://github.com/chrisballinger/openvpn/tree/0f77573024e69c34ec8a5cbc0744e126ad73de27
## Clean

To clean the `Submodules/openvpn` build folder:
	
	$ cd /Submodules/openvpn
    $ git clean -f && git clean -f -X

But you don't  have to rebuild the library, I have add library into the project
## Configuration

Simplest OpenVPN setup: [Static Key Mini-HOWTO](http://openvpn.net/index.php/open-source/documentation/miscellaneous/78-static-key-mini-howto.html)

if you are interested or have problems when use, pls contact me

skype: tranvietanh.hust@gmail.com
email: tranvietanh.hust@gmail.com

Do not hesitate, just a small fee I will help you complete the OpenVPN project on IOS
