//
//  SNTabBar.m
//  SNImagePicker
//
//  Created by Mtel on 2017/3/21.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import "SNTabBar.h"

@implementation SNTabBar

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.translucent = NO;
        self.backgroundColor = [UIColor orangeColor];
        self.barTintColor = [UIColor brownColor];
        self.tintColor = [UIColor redColor];
        
    }
    return self;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.translucent = NO;
    }
    return self;
}


@end
