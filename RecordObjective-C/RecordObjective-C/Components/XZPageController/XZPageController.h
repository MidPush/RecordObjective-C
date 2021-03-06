//
//  XZPageController.h
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZPageController : UIViewController

@property (nonatomic, strong, readonly) NSArray *viewControllers;

@property (nonatomic, assign) BOOL contentOffsetAnimation; // defalut NO

- (instancetype)initWithViewControllers:(NSArray *)viewControllers;


@end
