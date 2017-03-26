//
//  AssetImageCell.h
//  QBImagePicker
//
//  Created by SNde on 2017/2/15.
//  Copyright © 2017年 Katsuma Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssetImageCell : UICollectionViewCell
@property (copy, nonatomic)void(^palyBlock)(AssetImageCell *theCell);

@property (strong, nonatomic) UIImageView *imgImageView;
@property (strong, nonatomic) UIButton *playBtn;

@end
