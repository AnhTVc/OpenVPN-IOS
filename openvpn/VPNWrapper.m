//
//  VPNWrapper.m
//  openvpn
//
//  Created by Christopher Ballinger on 11/3/13.
//
//

#import "VPNWrapper.h"

extern char* openvpn_main(int argc, char *argv[], char* foder_document);

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

/**
 * If connect to OpenVPN server success:
 * Core OpenVPN write IP Client to Document folder. File name is: ip.txt
 * Delete if file exit when start OpenVPN
 */
- (void) startWithOptions:(NSArray *)options {
    // Delete file ip.txt
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
   // [self deleteFileInFolder:documentsDirectory namefilee:@"ip.txt"];
    
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
    const char* path = [documentsDirectory UTF8String];
    
    char* returnValue = openvpn_main(argc, argv, path);
    free(argv);
}

@end
