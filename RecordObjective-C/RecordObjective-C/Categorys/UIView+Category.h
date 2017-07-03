//
//  UIView+Category.h
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)
@property (nonatomic, readonly) UIViewController *viewController;

- (UIImage *)snapshotImage;
- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;
- (NSData *)snapshotPDF;

- (void)removeAllSubviews;


/// Position
@property (nonatomic, assign) CGFloat left;     // x
@property (nonatomic, assign) CGFloat top;      // y
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@end
