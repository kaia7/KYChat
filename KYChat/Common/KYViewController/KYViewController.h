//
//  KYViewController.h
//  KYChat
//
//  Created by ITD on 2017/3/31.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYViewController : UIViewController

@property (nonatomic, copy) NSString *analyzeTitle;

/// 当前VC stutusBar的状态，仅在viewWillAppear时生效，默认LightContent
@property (nonatomic, assign) UIStatusBarStyle stausBarStyle;

@end
