//
//  VPNViewController.m
//  openvpn
//
//  Created by Christopher Ballinger on 11/3/13.
//
//

#import "VPNViewController.h"
#import "VPNWrapper.h"
#include "TunnelUtil.h"

@interface VPNViewController ()

@end

@implementation VPNViewController{
    TunnelUtil *util;
    bool isConnect;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_btnConnectText setTitle:@"Loading..." forState:UIControlStateNormal];
    dispatch_async(self.coreVPN, ^{
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"udp" ofType:@"ovpn"];
        NSString *filepass = [[NSBundle mainBundle] pathForResource:@"pass" ofType:@"txt"];
        NSString *filecert = [[NSBundle mainBundle] pathForResource:@"cert" ofType:@"file"];
        NSString *fileca = [[NSBundle mainBundle] pathForResource:@"ca" ofType:@"file"];
        //[[VPNWrapper sharedInstance] startWithOptions:@[@"--help"]];
        //[P startTunnel];
        
        [[VPNWrapper sharedInstance] startWithOptions:@[@"--config", filepath, @"--auth-user-pass", filepass
                                                        , @"--cert", filecert
                                                        , @"--ca", fileca]];
    });
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


@end
