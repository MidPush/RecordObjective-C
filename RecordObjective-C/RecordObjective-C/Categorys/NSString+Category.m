//
//  NSString+Category.m
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Category)

- (NSString *)md5 {
    unsigned char digest[16], i;
    CC_MD5([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i = 0; i < 16; i++) {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return ms;
}

@end
