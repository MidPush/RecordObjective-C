//
//  UIDevice+Category.h
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Category)

+ (double)systemVersion;

@property (nonatomic, assign, readonly) BOOL isPad;

@property (nonatomic, assign, readonly) BOOL isSimulator;

// 是否越狱
@property (nonatomic, assign, readonly) BOOL isJailbroken;

@end


