//
//  SNAlbumsViewController.h
//  SNImagePicker
//
//  Created by SNde on 2017/3/1.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "SNImagePickerController.h"

@interface SNAlbumsViewController : UITableViewController
@property (nonatomic, strong) SNImagePickerController *imagePickerController;

@end
