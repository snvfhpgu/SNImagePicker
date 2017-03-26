//
//  SNMenuController.m
//  SNImagePicker
//
//  Created by Mtel on 2017/3/23.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import "SNMenuController.h"
#import "SNView+Frame.h"
@interface SNMenuController ()

@end

@implementation SNMenuController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self defaultSetting];
    }
    return self;
}


+(instancetype)contentViewController:(UIViewController *)contenViewController
                  menuViewController:(UIViewController *)menuViewController {
    SNMenuController *menu = [[SNMenuController alloc]init];
    menu.contentViewController = contenViewController;
    menu.leftViewController = menuViewController;
    return menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)defaultSetting {
    _animateDuration = 0.35;
    _contentViewShouldShowSize = self.view.width/5;
}

#pragma mark -
-(void)showLeftMenu {
    UIView *contentView = self.contentViewController.view;
    CGRect rect = self.view.frame;
    rect.size.width = rect.size.width;
    rect.size.height = rect.size.height;
    rect.origin.x = self.view.width - self.contentViewShouldShowSize;

    
    [UIView animateWithDuration:self.animateDuration animations:^{
        contentView.frame = rect;
    }completion:^(BOOL finished) {
        
    }];
}

-(void)hidenLeftMenu {
    UIView *contentView = self.contentViewController.view;
    [UIView animateWithDuration:self.animateDuration animations:^{
        contentView.frame = self.view.bounds;
    }completion:^(BOOL finished) {}];

}


#pragma mark - set Action
-(void)setLeftViewController:(UIViewController *)leftViewController {
    if (_leftViewController) {
        [_leftViewController.view removeFromSuperview];
        [_leftViewController removeFromParentViewController];
    }
    _leftViewController = leftViewController;
    leftViewController.view.frame = self.view.bounds;
    [self.view insertSubview:leftViewController.view atIndex:0];
    [self addChildViewController:leftViewController];
}

-(void)setContentViewController:(UIViewController *)contentViewController {
    if (_contentViewController) {
        [_contentViewController.view removeFromSuperview];
        [_contentViewController removeFromParentViewController];
    }
    _contentViewController = contentViewController;
    [self.view addSubview:contentViewController.view];
    [self addChildViewController:contentViewController];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
