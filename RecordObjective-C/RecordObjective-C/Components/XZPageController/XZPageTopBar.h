//
//  XZPageTopBar.h
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * demo topBar
 */

@class XZPageTopBar;
@protocol XZPageTopBarDelegate <NSObject>
- (void)itemAtIndex:(NSUInteger)index didSelectInPagesContainerTopBar:(XZPageTopBar *)topBar;
@end

@interface XZPageTopBar : UIView
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSUInteger selectedIndex;
@property (nonatomic, strong) NSArray *itemTitles;
@property (nonatomic, strong) UIColor *itemTitleColor;
@property (nonatomic, strong) UIColor *selectedItemTitleColor;
@property (nonatomic, strong) UIFont *itemTileFont;
@property (nonatomic, strong) UIFont *selectedItemTileFont;
@property (nonatomic, weak) id <XZPageTopBarDelegate> delegate;
@end
