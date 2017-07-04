//
//  ViewController.m
//  RecordObjective-C
//
//  Created by Apple on 2017/5/27.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *viewControllers;

@end

@implementation ViewController

- (NSArray *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = @[
                             @"UICollectionViewDemo",
                             @"XZPageControllerDemo"
                             ];
    }
    return _viewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"RecordObjective-C";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.viewControllers[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = [[NSClassFromString(self.viewControllers[indexPath.row]) alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
