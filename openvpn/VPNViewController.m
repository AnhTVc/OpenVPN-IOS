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
    util = [[TunnelUtil alloc] init];
    isConnect = false;
    [util deleteFileInDocument:@"ip.txt"];
    self.queue = dispatch_queue_create("check queue", 0);
    self.coreVPN = dispatch_queue_create("check coreVPN", 0);
    // Do any additional setup after loading the view.
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"tcp" ofType:@"ovpn"];
    NSString *filepass = [[NSBundle mainBundle] pathForResource:@"pass" ofType:@"txt"];
    NSString *filecert = [[NSBundle mainBundle] pathForResource:@"cert" ofType:@"file"];
    NSString *fileca = [[NSBundle mainBundle] pathForResource:@"ca" ofType:@"file"];
    //[[VPNWrapper sharedInstance] startWithOptions:@[@"--help"]];
    //[P startTunnel];
    
    [[VPNWrapper sharedInstance] startWithOptions:@[@"--config", filepath, @"--auth-user-pass", filepass
                                                    , @"--cert", filecert
                                                    , @"--ca", fileca]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (NSString *) netmaskToSubnet:(NSString *) netmask{
    NSArray *array = [netmask componentsSeparatedByString:@"."];
    NSString *result = [[NSString alloc] init];
    if([array[3] isEqualToString:@"255"]){
        result = array[0];
        result = [result stringByAppendingString:@"."];
        result = [result stringByAppendingString:array[1]];
        
        result = [result stringByAppendingString:@"."];
        result = [result stringByAppendingString:array[2]];
        result = [result stringByAppendingString:@"."];
        result = [result stringByAppendingString:@"0"];
    }else{
        result = netmask;
    }
    return  result;
}
@end
