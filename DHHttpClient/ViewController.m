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
