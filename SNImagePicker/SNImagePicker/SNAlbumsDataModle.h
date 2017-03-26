//
//  SNAlbumsDataModle.h
//  SNImagePicker
//
//  Created by SNde on 2017/3/2.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
@interface SNAlbumsDataModle : NSObject
@property (strong, nonatomic) PHFetchResult *fetchResult;
@property (strong, nonatomic) NSString *title;

@end
