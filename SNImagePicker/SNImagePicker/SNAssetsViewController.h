//
//  SNAssetsViewController.h
//  SNImagePicker
//
//  Created by SNde on 2017/3/3.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "SNImagePickerController.h"

@interface SNAssetsViewController : UICollectionViewController
@property (nonatomic, strong) PHFetchResult *dataSource;
@property (nonatomic, strong) SNImagePickerController *imagePickerController;

@end
