//
//  AssetImageCell.m
//  SNImagePicker
//
//  Created by SNde on 2017/2/15.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import "AssetImageCell.h"

@implementation AssetImageCell

-(void)awakeFromNib {
    [super awakeFromNib];
}

-(UIImageView *)imgImageView {
    if (!_imgImageView) {
        _imgImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        _imgImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView insertSubview:_imgImageView atIndex:0];
    }
    return _imgImageView;
}

-(UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        _playBtn.center = self.contentView.center;
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"MMVideoPreviewPlay"] forState:(UIControlStateNormal)];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"MMVideoPreviewPlayHL"] forState:(UIControlStateHighlighted)];
        [_playBtn addTarget:self action:@selector(playBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_playBtn];
    }
    return _playBtn;
}

-(void)playBtn:(UIButton *)sender {
    if (_palyBlock) {
        _palyBlock(self);
    }
}

@end
