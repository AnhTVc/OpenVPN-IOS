//
//  VPNWrapper.m
//  openvpn
//
//  Created by Christopher Ballinger on 11/3/13.
//
//

#import "VPNWrapper.h"

extern int openvpn_main(int argc, char *argv[]);

@interface VPNWrapper()
@property (nonatomic) BOOL isStarted;
@end

@implementation VPNWrapper

+ (VPNWrapper*) sharedInstance {
    static VPNWrapper *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[VPNWrapper alloc] init];
    });
    return _sharedInstance;
}

- (id) init {
    if (self = [super init]) {
        self.queue = dispatch_queue_create("openvpn queue", 0);
    }
    return self;
}

- (void) startWithOptions:(NSArray *)options {
    dispatch_async(self.queue, ^{
        if (self.isStarted) {
            return;
        }
        self.isStarted = YES;
        NSMutableArray *arguments = [NSMutableArray arrayWithCapacity:1+[options count]];
        [arguments addObject:@"openvpn"];
        [arguments addObjectsFromArray:options];
        
        int argc = [arguments count];
        char **argv = malloc(sizeof(char*) * (argc + 1));
        
        [arguments enumerateObjectsUsingBlock:^(NSString *option, NSUInteger i, BOOL *stop) {
            const char * c_string = [option UTF8String];
            int length = strlen(c_string);
            char *c_string_copy = (char *) malloc(sizeof(char) * (length + 1));
            strcpy(c_string_copy, c_string);
            argv[i] = c_string_copy;
        }];
        argv[argc] = NULL;
        
        int returnValue = openvpn_main(argc, argv);
        free(argv);
    });
}

@end
