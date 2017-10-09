//
//  ViewController.m
//  DHHttpClient
//
//  Created by dahe on 2017/9/22.
//  Copyright © 2017年 dahe. All rights reserved.
//

#import "ViewController.h"
#import "DHHttpClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[DHHttpClient shareInstance]setHeader:@{
                                             @"Accept-Language" : @"zh-Hans-CN, en-us;q=0.8",
                                             @"User-Agent" : @"HNRM/1.9.1 (iPhone; iOS 11.0; Scale/3.00)",
                                             @"deviceID" : @"4e918db8ee01d0cebcf34d47c710d35164a6efe8",
                                             @"os" : @"apple",
                                             @"token" : @"MTU5MDM2OTU4NjI=",
                                             @"version" : @"1.9.1"
                                             }];
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    [[DHHttpClient shareInstance]uploadImageWithURL:@"https://rm.dahe.cn/mobile/material/uploads" parameters:nil data:UIImageJPEGRepresentation(image, 1.f) success:^(id responseObject) {
        
    } fail:^(NSError *error) {
        
    } progress:^(NSProgress *progress) {
        
    } fileName:@"image"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
