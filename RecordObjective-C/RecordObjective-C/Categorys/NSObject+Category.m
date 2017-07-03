//
//  NSObject+Category.m
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

@implementation NSObject (Category)

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self, originalSel, class_getMethodImplementation(self, originalSel), method_getTypeEncoding(originalMethod));
    
    class_addMethod(self, newSel, class_getMethodImplementation(self, newSel), method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel), class_getInstanceMethod(self, newSel));
    
    return YES;
}

+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel {
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;

}


+ (void)printPropertyWithDict:(NSDictionary *)dict {
   
    NSMutableString *string = [NSMutableString string];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *oneProperty = [[NSString alloc]init];
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;", key];
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;", key];
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]) {
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;", key];
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;", key];
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;)", key];
        }
        [string appendFormat:@"\n%@\n", oneProperty];
    }];
    NSLog(@"%@",string);
}

@end
