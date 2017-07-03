//
//  XZPageController.m
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import "XZPageController.h"
#import "XZPageTopBar.h"

@interface XZPageController () <UIScrollViewDelegate, XZPageTopBarDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSMutableSet *cache;
@property (nonatomic, strong) XZPageTopBar *topBar;

@end

@implementation XZPageController

- (NSMutableSet *)cache {
    if (!_cache) {
        _cache = [NSMutableSet set];
    }
    return _cache;
}

- (XZPageTopBar *)topBar {
    if (!_topBar) {
        _topBar = [[XZPageTopBar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 64)];
        _topBar.itemTitles = _titles;
        _topBar.delegate = self;
    }
    return _topBar;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topBar.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.topBar.frame))];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.scrollsToTop = NO;
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * self.viewControllers.count, 0);
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (instancetype)initWithViewControllers:(NSArray *)viewControllers {
    if (self = [super init]) {
        if (viewControllers.count == 0 || viewControllers == nil) {
            return nil;
        }
        _contentOffsetAnimation = NO;
        _viewControllers = viewControllers.copy;
        NSMutableArray *titles = [NSMutableArray array];
        for (UIViewController *vc in _viewControllers) {
            [titles addObject:vc.title];
        }
        _titles = titles.copy;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topBar];
    [self.view addSubview:self.scrollView];
    [self scrollViewDidEndDecelerating:self.scrollView];
}

- (void)setCurrentPage:(NSInteger)currentPage {
    if (_currentPage != currentPage) {
        _currentPage = currentPage;
        self.topBar.selectedIndex = currentPage;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSInteger previousPage = currentPage - 1;
    NSInteger nextPage = currentPage + 1;
    previousPage = previousPage < 0 ? 0 : previousPage;
    nextPage = nextPage > self.viewControllers.count - 1 ? self.viewControllers.count - 1 : nextPage;
    
    [self preloadControllerFromCache:previousPage];
    [self preloadControllerFromCache:nextPage];
}

- (void)preloadControllerFromCache:(NSInteger)index {
    UIViewController *visibleVc = self.viewControllers[index];
    if (visibleVc.view.superview) {
        return;
    }
    if ([self.cache containsObject:visibleVc]) {
        [self.scrollView addSubview:visibleVc.view];
    }
}

- (void)loadControllerAtIndex:(NSInteger)index {
    UIViewController *visibleVc = self.viewControllers[index];
    if (visibleVc.view.superview) {
        return;
    }
    if (index == self.currentPage) {
        visibleVc.view.frame = CGRectMake(index * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:visibleVc.view];
        if (![self.cache containsObject:visibleVc]) {
            [self.cache addObject:visibleVc];
        }
    } else {
        if ([self.cache containsObject:visibleVc]) {
            [self.scrollView addSubview:visibleVc.view];
        }
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    self.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSInteger previousPage = self.currentPage - 1;
    NSInteger nextPage = self.currentPage + 1;
    previousPage = previousPage < 0 ? 0 : previousPage;
    nextPage = nextPage > self.viewControllers.count - 1 ? self.viewControllers.count - 1 : nextPage;
    
    UIViewController *visibleVc = self.viewControllers[_currentPage];
    UIViewController *previousVc = self.viewControllers[previousPage];
    UIViewController *nextVc = self.viewControllers[nextPage];
    
    [self loadControllerAtIndex:self.currentPage];
    [self loadControllerAtIndex:previousPage];
    [self loadControllerAtIndex:nextPage];
    
    for (UIView *view in scrollView.subviews) {
        if (view == visibleVc.view || view == previousVc.view || view == nextVc.view) {
            continue;
        }else {
            // NSLog(@"第%ld个remove", [self indexForView:view]);
            [view removeFromSuperview];
        }
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}

- (NSInteger)indexForView:(UIView *)view {
    for (NSInteger i = 0; i < self.viewControllers.count; i++) {
        UIViewController *vc = self.viewControllers[i];
        if (view == vc.view) {
            return i;
        }
    }
    return NSNotFound;
}

#pragma mark - <PageTopBarDelegate>

- (void)itemAtIndex:(NSUInteger)index didSelectInPagesContainerTopBar:(XZPageTopBar *)topBar {
    if (index == self.currentPage) return;
    self.currentPage = index;
    if (_contentOffsetAnimation) {
        [self.scrollView setContentOffset:CGPointMake(index * self.scrollView.frame.size.width, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(index * self.scrollView.frame.size.width, 0) animated:NO];
        [self scrollViewDidEndDecelerating:self.scrollView];
    }
}

@end
