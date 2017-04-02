//
//  KYViewController.m
//  KYChat
//
//  Created by ITD on 2017/3/31.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "KYViewController.h"

@interface KYViewController ()

@end

@implementation KYViewController

- (id)init
{
    
    if (self == [super init]) {
        [self setStausBarStyle:UIStatusBarStyleDefault];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorGrayBG]];

 
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    [MobClick beginLogPageView:self.analyzeTitle];
    if ([UIApplication sharedApplication].statusBarStyle != self.stausBarStyle) {
        [UIApplication sharedApplication].statusBarStyle = self.stausBarStyle;
    }
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//     [MobClick endLogPageView:self.analyzeTitle];
    
}
- (void)dealloc
{
#ifdef DEBUG_MEMERY
    NSLog(@"dealloc %@", self.navigationItem.title);
#endif
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
