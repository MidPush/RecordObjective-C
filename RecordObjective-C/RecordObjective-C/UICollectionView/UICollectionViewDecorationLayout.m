//
//  UICollectionViewDecorationLayout.m
//  sss
//
//  Created by zhong on 2017/4/13.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import "UICollectionViewDecorationLayout.h"
#import <objc/runtime.h>

static NSString *const UICollectionElementKindSectionDecoration = @"UICollectionElementKindSectionDecoration";
static char *key = "\n";

@interface UICollectionViewLayoutAttributes (BackgroundColor)
@property (nonatomic, strong) UIColor *sectionBackgroundColor;
@end

@implementation UICollectionViewLayoutAttributes (SectionBackgroundColor)

- (void)setSectionBackgroundColor:(UIColor *)sectionBackgroundColor {
     objc_setAssociatedObject(self, key, sectionBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)sectionBackgroundColor {
    return objc_getAssociatedObject(self, key);
}

@end

#pragma mark - UICollectionDecorationView

@interface UICollectionDecorationView : UICollectionReusableView

@end

@implementation UICollectionDecorationView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    self.backgroundColor = layoutAttributes.sectionBackgroundColor;
}

@end

@interface UICollectionViewDecorationLayout ()
@property (nonatomic, strong) NSArray *decorationAttrs;
@end

@implementation UICollectionViewDecorationLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    id <UICollectionViewDelegateSectionBackgroundLayout> delegate = (id) self.collectionView.delegate;
    if (![delegate respondsToSelector:@selector(collectionView: layout:backgroundColorForSectionAtIndex:)]) return;
    
    [self registerClass:[UICollectionDecorationView class] forDecorationViewOfKind:UICollectionElementKindSectionDecoration];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSInteger section = 0; section < self.collectionView.numberOfSections; section++) {
        
        NSInteger numberOfItemsInSection = [self.collectionView numberOfItemsInSection:section];
        if (numberOfItemsInSection > 0) {
            UIEdgeInsets sectionInset = self.sectionInset;
            if ([delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
                sectionInset = [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
            }
            
            UICollectionViewLayoutAttributes *firstAttr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
            UICollectionViewLayoutAttributes *lastAttr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:numberOfItemsInSection - 1 inSection:section]];
            
            CGFloat decorationViewX = firstAttr.frame.origin.x;
            CGFloat decorationViewY = firstAttr.frame.origin.y;
            CGFloat decorationViewWidth = CGRectGetWidth(self.collectionView.frame) - sectionInset.left - sectionInset.right;
            CGFloat decorationViewHeight = CGRectGetMaxY(lastAttr.frame) - CGRectGetMinY(firstAttr.frame);
            
            if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
                decorationViewWidth = firstAttr.frame.size.width;
                decorationViewHeight = CGRectGetHeight(self.collectionView.frame) - sectionInset.top - sectionInset.bottom;
            }
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
            UICollectionViewLayoutAttributes *decorationAttr = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:UICollectionElementKindSectionDecoration withIndexPath:indexPath];
            decorationAttr.frame = CGRectMake(decorationViewX, decorationViewY, decorationViewWidth, decorationViewHeight);
            decorationAttr.zIndex = -1;
            decorationAttr.sectionBackgroundColor = [delegate collectionView:self.collectionView layout:self backgroundColorForSectionAtIndex:section];
            [tempArray addObject:decorationAttr];
        }
    }
    _decorationAttrs = tempArray.copy;
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attrs = [super layoutAttributesForElementsInRect:rect].mutableCopy;
    for (UICollectionViewLayoutAttributes *attr in _decorationAttrs) {
        if (CGRectIntersectsRect(rect, attr.frame)) {
            [attrs addObject:attr];
        }
    }
    return attrs.copy;
}
@end
