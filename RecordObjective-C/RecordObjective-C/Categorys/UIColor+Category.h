//
//  UIColor+Category.h
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;
+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue;
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexStr;

- (UIImage *)pureColorImage;
- (UIImage *)pureColorImageWithSize:(CGSize)size;

+ (UIColor *)randomColor;

@end
