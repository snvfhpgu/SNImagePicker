//
//  SNTabBarController.m
//  SNImagePicker
//
//  Created by SNde on 2017/3/21.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import "SNTabBarController.h"
#import "SNView+Frame.h"

@interface SNTabBarController ()<UITabBarDelegate>
@property (strong, nonatomic) NSMutableArray <UIView*> *tabBarItemBGs;

@end

@implementation SNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor whiteColor];
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.unselectedItemTintColor = [UIColor orangeColor];
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if (!_tabBarItemBGs) {
        
        CGFloat width = self.tabBar.width/self.viewControllers.count;
        CGFloat height = self.tabBar.height;
        for (int i = 0; i < self.viewControllers.count ; i++) {
            UITabBarItem *item = self.tabBar.items[i];
            item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            item.selectedImage = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            item.tag = i;
            CGRect rect = CGRectMake(width*i, 0, width, height);
            UIView *bg = [[UIView alloc]initWithFrame:rect];
            [self.tabBar insertSubview:bg atIndex:1];
            [self.tabBarItemBGs addObject:bg];
        }
        self.tabBarItemBGs[self.selectedIndex].backgroundColor = self.tabBar.unselectedItemTintColor;
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - <UITabBarDelegate>
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    for (int i = 0; i < self.viewControllers.count ; i++) {
        if (i==item.tag) {
            self.tabBarItemBGs[i].backgroundColor = [UIColor orangeColor];
        }else {
            self.tabBarItemBGs[i].backgroundColor = [UIColor clearColor];
        }
    }
}


#pragma mark - get 
-(NSMutableArray<UIView *> *)tabBarItemBGs {
    if (!_tabBarItemBGs) {
        _tabBarItemBGs = [@[]mutableCopy];
    }
    return _tabBarItemBGs;
}


@end
