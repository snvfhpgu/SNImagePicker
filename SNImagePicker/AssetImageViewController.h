//
//  AssetImageViewController.h
//  QBImagePicker
//
//  Created by SNde on 2017/2/15.
//  Copyright © 2017年 Katsuma Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@interface AssetImageViewController : UIViewController
@property (nonatomic, copy) NSArray<PHAsset *> *assets;
@property (nonatomic, assign) NSInteger index;

@end
