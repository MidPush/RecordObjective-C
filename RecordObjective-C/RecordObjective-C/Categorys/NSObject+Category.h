//
//  NSObject+Category.h
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)


// ============================= runtime =============================

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;
+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;

/**
 生成model属性列表
 */
+ (void)printPropertyWithDict:(NSDictionary *)dict;

@end
