//
//  UIImage+Category.h
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

- (UIImage *)circleImage;

// color -> image
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark - Image Effect (YYKit)

- (UIImage *)imageByTintColor:(UIColor *)tintColor;

/// 毛玻璃
- (UIImage *)imageByBlurLight;
- (UIImage *)imageByBlurDark;
- (UIImage *)imageByBlurWithTint:(UIColor *)tintColor;

- (UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                     tintColor:(UIColor *)tintColor
                      tintMode:(CGBlendMode)tintBlendMode
                    saturation:(CGFloat)saturation
                     maskImage:(UIImage *)maskImage;

@end
