//
//  UICollectionViewDecorationLayout.h
//  sss
//
//  Created by zhong on 2017/4/13.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

/**
 *  自定义UICollectionViewLayout
 *  功能：给UICollectionView Section 添加 backgroundColor
 */

#import <UIKit/UIKit.h>

@protocol UICollectionViewDelegateSectionBackgroundLayout <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSectionAtIndex:(NSInteger)section;
@end

@interface UICollectionViewDecorationLayout : UICollectionViewFlowLayout

@end
