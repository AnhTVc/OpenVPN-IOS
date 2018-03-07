//
//  TunnelUtil.h
//  openvpn
//
//  Created by Tran Viet Anh on 6/13/17.
//
//

#import <Foundation/Foundation.h>

@interface TunnelUtil : NSObject
/**
 Check content file ip client.
 If content have final==> complete
 File Example:
 (null)5.39.126.59-192.168.2.1-255.255.255.255
 0.0.0.0-10.5.0.37-128.0.0.0
 128.0.0.0-10.5.0.37-128.0.0.0
 10.5.0.1-10.5.0.37-255.255.255.255
 final
 @param fileContent content file
 @return true or false
 */
- (bool) checkFileIpClient:(NSString *) fileContent;
- (void) deleteFileInFolder:(NSString *) folder namefilee:(NSString*) fileName;
- (NSString*) fileToNSString:(NSString *) folder namefilee:(NSString*) fileName;
- (NSString*) readFileInDocument:(NSString*) fileName;
- (void) deleteFileInDocument:(NSString*) fileName;

- (NSArray *) getInfoInFileIP;
@end
