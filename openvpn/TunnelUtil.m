//
//  TunnelUtil.m
//  openvpn
//
//  Created by Tran Viet Anh on 6/13/17.
//
//

#import "TunnelUtil.h"

@implementation TunnelUtil{
    
}
- (bool) checkFileIpClient:(NSString *) fileContent{
    if(fileContent != nil){
        if ([fileContent rangeOfString:@"Initialization Sequence Completed"].location == NSNotFound)
            return false;
        else
            return true;
    }
    return false;
    
}


- (void) deleteFileInFolder:(NSString *) folder namefilee:(NSString*) fileName{
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:folder error:nil];
    for (NSString *filename in fileArray)  {
        if([filename isEqualToString:fileName])
            [fileMgr removeItemAtPath:[folder stringByAppendingPathComponent:filename] error:NULL];
    }
    
}

- (NSString*) fileToNSString:(NSString *) folder namefilee:(NSString*) fileName{
    NSString *logFilePath = [folder stringByAppendingPathComponent:fileName];
    
    NSString* fileContents =
    [NSString stringWithContentsOfFile:logFilePath
                              encoding:NSUTF8StringEncoding error:nil];
    
    return fileContents;
}

- (NSString*) readFileInDocument:(NSString*) fileName{
    if(fileName == nil){
        fileName = @"ip.txt";
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [self fileToNSString:documentsDirectory namefilee:fileName];
}

- (void) deleteFileInDocument:(NSString*) fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:nil];
    for (NSString *filename in fileArray)  {
        [fileMgr removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
    }
}


/**
 fileIPContent example:
 5.39.126.59-192.168.2.1-255.255.255.255
 0.0.0.0-10.6.0.9-128.0.0.0
 128.0.0.0-10.6.0.9-128.0.0.0
 10.6.0.1-10.6.0.9-255.255.255.255
 
 @return <#return value description#>
 */

- (NSArray *) getInfoInFileIP{
    NSString *fileName = @"ip.txt";
    NSString *fileIPContent = [self readFileInDocument:fileName];
    NSLog(@"\n%@", fileIPContent);
    if(fileIPContent != nil){
        NSArray *lines = [fileIPContent componentsSeparatedByString:@"\n"];
        //get server address
        NSString *serverAddress = [lines[0] componentsSeparatedByString:@"-"][0];
        NSLog(@"server address: %@", serverAddress);
        NSString *ipClient = [lines[lines.count - 2] componentsSeparatedByString:@"-"][1];
        NSLog(@"ip client: %@", ipClient);
        NSArray *result = [[NSArray alloc] initWithObjects:serverAddress, ipClient, nil];
        return result;
    }
    return nil;
}
@end
