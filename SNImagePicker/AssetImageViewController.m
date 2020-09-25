//
//  AssetImageViewController.m
//  SNImagePicker
//
//  Created by SNde on 2017/2/15.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import "AssetImageViewController.h"
#import "AssetImageCell.h"
#import <AVKit/AVKit.h>

@interface AssetImageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *coloectView;

@end

@implementation AssetImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navigationController) {
        self.navigationController.toolbarHidden = true;
    }
    CGFloat mainWidth = [UIScreen mainScreen].bounds.size.width;
//   CGFloat mainHeight = [UIScreen mainScreen].bounds.size.height;

    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainWidth, 64)];
    [topView setBackgroundColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.7]];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 44, 44)];
    [backBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [backBtn setTitle:@"<" forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(backBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [topView addSubview:backBtn];
    [self.view addSubview:topView];
    
    [self.view addSubview:self.coloectView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_index != NSNotFound) {
        CGFloat mainWidth = [UIScreen mainScreen].bounds.size.width;
        [self.coloectView setContentOffset:CGPointMake(mainWidth*_index, 0) animated:false];
        _index = NSNotFound;
    }
}

-(void)backBtn:(UIButton *)sender {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:true];
    }else {
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _assets.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    AssetImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AssetImageCell" forIndexPath:indexPath];

    PHAsset *asset = _assets[indexPath.row];
    cell.playBtn.hidden = !(asset.mediaType == PHAssetMediaTypeVideo);
    [[PHImageManager defaultManager]requestImageDataForAsset:asset options:[PHImageRequestOptions new] resultHandler:^(NSData *imageData, NSString * dataUTI, UIImageOrientation orientation, NSDictionary * info) {
        if (imageData) {
            cell.imgImageView.image = [UIImage imageWithData:imageData];
        }
    }];
    [cell setPalyBlock:^(AssetImageCell *theCell) {
        NSIndexPath *indexPath0 = [collectionView indexPathForCell:theCell];
        [[PHImageManager defaultManager]requestPlayerItemForVideo:self.assets[indexPath0.row] options:[PHVideoRequestOptions new] resultHandler:^(AVPlayerItem * playerItem, NSDictionary *info) {
            if (playerItem) {
                AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
                playerVC.player = [AVPlayer playerWithPlayerItem:playerItem];
                [self presentViewController:playerVC animated:true completion:^{
                    [playerVC.player pause];
                    [playerVC.player play];
                }];
            }
        }];
    }];
    return cell;
}


-(UICollectionView *)coloectView {
    if (!_coloectView) {
        CGFloat mainWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat mainHeight = [UIScreen mainScreen].bounds.size.height;
        CGRect rect = CGRectMake(0, 64, mainWidth, mainHeight-64*2);
        
        UICollectionViewFlowLayout *folwLayout = [[UICollectionViewFlowLayout alloc]init];
        folwLayout.itemSize = rect.size;
        folwLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        folwLayout.minimumInteritemSpacing = 0;
        folwLayout.minimumLineSpacing = 0;
        
        _coloectView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:folwLayout];
        _coloectView.delegate = self;
        _coloectView.dataSource = self;
        _coloectView.pagingEnabled = true;
        
        [_coloectView registerClass:[AssetImageCell class] forCellWithReuseIdentifier:@"AssetImageCell"];

    }
    return _coloectView;
}



@end
