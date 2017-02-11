//
//  VPNViewController.m
//  openvpn
//
//  Created by Christopher Ballinger on 11/3/13.
//
//

#import "VPNViewController.h"
#import "VPNWrapper.h"

@interface VPNViewController ()

@end

@implementation VPNViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSString *secretKeyPath = [[NSBundle mainBundle] pathForResource:@"static" ofType:@"key"];
    NSString *localEndpoint = @"10.8.0.1";
    NSString *remoteEndpoint = @"10.8.0.2";
    [[VPNWrapper sharedInstance] startWithOptions:@[@"--dev", @"tun", @"--ifconfig", localEndpoint, remoteEndpoint, @"--secret", secretKeyPath]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
