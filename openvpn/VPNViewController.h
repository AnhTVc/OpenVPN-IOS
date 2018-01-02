//
//  VPNViewController.h
//  openvpn
//
//  Created by Christopher Ballinger on 11/3/13.
//
//

#import <UIKit/UIKit.h>

@interface VPNViewController : UIViewController

- (IBAction)btn:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnConnectText;
@property (nonatomic) dispatch_queue_t queue;
@property (nonatomic) dispatch_queue_t coreVPN;
@end
