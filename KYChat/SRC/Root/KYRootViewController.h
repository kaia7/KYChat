//
//  RootViewController.h
//  KYChat
//
//  Created by ITD on 2017/3/31.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "KYTabBarController.h"



@interface KYRootViewController : KYTabBarController

+ (KYRootViewController *)sharedRootViewController;
/**
 *  获取tabbarController的第Index个VC（不是navController）
 *
 *  @return navController的rootVC
 */

- (id)childViewControllerAtIndex:(NSUInteger)index;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;


@end
