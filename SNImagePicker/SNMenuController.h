//
//  SNMenuController.h
//  SNImagePicker
//
//  Created by SNde on 2017/3/23.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNMenuController : UIViewController
@property (strong, nonatomic) UIViewController *leftViewController;
@property (strong, nonatomic) UIViewController *contentViewController;

@property (assign, nonatomic) CGFloat contentViewShouldShowSize;
@property (assign, nonatomic) CGFloat animateDuration;


+(instancetype)contentViewController:(UIViewController *)contenViewController
                  menuViewController:(UIViewController *)menuViewController;

-(void)showLeftMenu;
-(void)hidenLeftMenu;

@end
