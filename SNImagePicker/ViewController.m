//
//  ViewController.m
//  SNImagePicker
//
//  Created by SNde on 2017/3/1.
//  Copyright © 2017年 SNde. All rights reserved.
//

#import "ViewController.h"
#import "AssetImageViewController.h"
#import "SNImagePickerController.h"
#import "SNLocalizationSystem.h"
#import "SNMenuController.h"

#define LocalizeString(key) \
SNLocalizeForTableName(key, @"SNImagePickerString")

@interface ViewController ()<SNImagePickerControllerDelegate>
{
    SNMenuController *menu;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *languageCode = [[NSLocale currentLocale]objectForKey:NSLocaleLanguageCode];
    NSString *countryCode  = [[NSLocale currentLocale]objectForKey:NSLocaleCountryCode];
    NSLog(@"languageCode = %@",languageCode);
    NSLog(@"countryCode = %@",countryCode);

//    SNLocalizeSetLanguage(@"zh-Hans");
//    SNLocalizeSetLanguage(@"en");
//    SNLocalizeSetLanguage(@"zh");
//    SNLocalizeSetLanguage(@"zh-Hant");
    self.title = LocalizeString(@"photo.ok");
    NSLog(@"%@ %@",languages,LocalizeString(@"photo.ok"));
    
  
    
}

- (IBAction)goImagePicker:(id)sender {

    SNImagePickerController *imagePickerController = [SNImagePickerController new];
    imagePickerController.pickerDelegate = self;
    imagePickerController.allowsMultipleSelection = true;
    imagePickerController.maxCountOfSelection = 9;
    imagePickerController.cameraShowType = SNImagePickerCameraShowAtLast;
    imagePickerController.mediaType      = SNImagePickerMediaTypeAny;
    [self presentViewController:imagePickerController animated:true completion:nil];
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 150, 60, 60)];
//    [imagePickerController.view addSubview:button];
//    button.backgroundColor = [UIColor redColor];
//    [button addTarget:self action:@selector(go:) forControlEvents:(UIControlEventTouchUpInside)];
//    
//    menu = [SNMenuController contentViewController:imagePickerController menuViewController:[AssetImageViewController new]];
//    
//    [self presentViewController:menu animated:true completion:nil];

}

-(void)go:(UIButton *)sender {
    sender.tag = !sender.tag;
    if (sender.tag) {
        [menu showLeftMenu];
    }else {
        [menu hidenLeftMenu];
    }
}

-(void)sn_imagePickerController:(SNImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray<PHAsset *> *)assets {
    NSString *str = NSStringFromSelector(@selector(sn_imagePickerController:didFinishPickingAssets:));
    NSLog(@"%@",str);
}

-(void)sn_imagePickerControllerDidCancel:(SNImagePickerController *)imagePickerController {
    NSString *str = NSStringFromSelector(@selector(sn_imagePickerControllerDidCancel:));
    NSLog(@"%@",str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
