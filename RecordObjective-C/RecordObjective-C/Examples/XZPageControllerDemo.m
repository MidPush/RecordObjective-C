//
//  XZPageControllerDemo.m
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import "XZPageControllerDemo.h"
#import "XZPageController.h"

@interface ContentViewController : UIViewController

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end

@interface XZPageControllerDemo ()

@end

@implementation XZPageControllerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 30; i++) {
        ContentViewController *vc = [[ContentViewController alloc] init];
        vc.title = [NSString stringWithFormat:@"第%ld个控制器", i];
        [array addObject:vc];
    }
    
    XZPageController *pageController = [[XZPageController alloc] initWithViewControllers:array];
    pageController.contentOffsetAnimation = YES;
    [self.view addSubview:pageController.view];
    [self addChildViewController:pageController];
    
}

@end
