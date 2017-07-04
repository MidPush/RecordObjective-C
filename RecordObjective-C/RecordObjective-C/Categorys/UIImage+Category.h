//
//  UIImage+Category.h
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

- (UIImage *)circularImage;

- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(UIColor *)borderColor;

- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;

// color -> image
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark - Image Effect (YYKit)

- (UIImage *)imageByTintColor:(UIColor *)tintColor;

/**
 *  typedef NS_ENUM(NSInteger, UIBlurEffectStyle) {
 *      UIBlurEffectStyleExtraLight,
 *      UIBlurEffectStyleLight,
 *      UIBlurEffectStyleDark,
 *      UIBlurEffectStyleExtraDark __TVOS_AVAILABLE(10_0) __IOS_PROHIBITED __WATCHOS_PROHIBITED,
 *      UIBlurEffectStyleRegular NS_ENUM_AVAILABLE_IOS(10_0), // Adapts to user interface style
 *      UIBlurEffectStyleProminent NS_ENUM_AVAILABLE_IOS(10_0), // Adapts to user interface style
 *  } NS_ENUM_AVAILABLE_IOS(8_0);
 *
 *  \\\- apple example -///
 *  UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
 *  UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
 */

/// 毛玻璃
- (UIImage *)imageByBlurLight;      // UIBlurEffectStyleLight
- (UIImage *)imageByBlurExtraLight; // UIBlurEffectStyleExtraLight
- (UIImage *)imageByBlurDark;       // UIBlurEffectStyleDark

- (UIImage *)imageByBlurWithTint:(UIColor *)tintColor;

- (UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                     tintColor:(UIColor *)tintColor
                      tintMode:(CGBlendMode)tintBlendMode
                    saturation:(CGFloat)saturation
                     maskImage:(UIImage *)maskImage;

@end
