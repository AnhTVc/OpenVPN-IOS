//
//  VPNWrapper.h
//  openvpn
//
//  Created by Christopher Ballinger on 11/3/13.
//
//

#import <Foundation/Foundation.h>
#import "Util.h"
@interface VPNWrapper : NSObject

@property (nonatomic) dispatch_queue_t queue;
extern char* xxxxxxx;
+ (VPNWrapper*) sharedInstance;

- (void) startWithOptions:(NSArray*)options;

@end
