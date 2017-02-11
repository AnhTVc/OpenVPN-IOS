//
//  VPNWrapper.h
//  openvpn
//
//  Created by Christopher Ballinger on 11/3/13.
//
//

#import <Foundation/Foundation.h>

@interface VPNWrapper : NSObject

@property (nonatomic) dispatch_queue_t queue;

+ (VPNWrapper*) sharedInstance;

- (void) startWithOptions:(NSArray*)options;

@end
