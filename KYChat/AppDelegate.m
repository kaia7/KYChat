//
//  AppDelegate.m
//  KYChat
//
//  Created by 凯  赵 on 2017/3/23.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "AppDelegate.h"

#import "KYRootViewController.h"
#import "TLLoginViewController.h"
#import "TLBaseProxy.h"
#import <BlocksKit.h>
#import "NSDate+Utilities.h"
#import "TLAccountViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark # - LifeCycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self p_initThirdPartSDK];      // 初始化第三方SDK
    [self k_initUI];                // 初始化UI

    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - #  Private Methods
- (void)p_initThirdPartSDK {
    
    // 友盟统计
    [MobClick startWithAppkey:UMENG_APPKEY reportPolicy:BATCH channelId:APP_CHANNEL];
    
    // 网络环境监测
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
/*
    // JSPatch
#ifdef DEBUG_JSPATCH
    [JSPatch testScriptInBundle];
#else
    [JSPatch startWithAppKey:JSPATCH_APPKEY];
    [JSPatch sync];
#endif
 */
    // Mob SMS
    //    [SMSSDK registerApp:MOB_SMS_APPKEY withSecret:MOB_SMS_SECRET];
    
    //提示框
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    // 日志
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
}

- (void)k_initUI {
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIViewController *rootVC;

    
    if (![KYUserHelper shareHelper].isLogin) {
        rootVC = [KYRootViewController sharedRootViewController];
        [self p_initUserData];          // 初始化用户信息
    } else {
        
        rootVC = [[TLAccountViewController alloc] init];
        KYWeakSelf(self);
        KYWeakSelf(rootVC);
        [(TLAccountViewController *)rootVC setLoginSuccess:^{
            [weakself p_initUserData];          // 初始化用户信息
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [weakrootVC.view removeFromSuperview];
            [weakself.window setRootViewController:[KYRootViewController sharedRootViewController]];
            [weakself.window addSubview:[KYRootViewController sharedRootViewController].view];

        }];
        
        
    }
    

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:rootVC];
    [self.window addSubview:rootVC.view];
    [self.window makeKeyAndVisible];
    
}

- (void) p_initUserData {
    
    NSNumber *lastRunDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastRunDate"];
    
    //首次进入app
    if (lastRunDate == nil) {
        [UIAlertView bk_showAlertViewWithTitle:@"提示" message:@"首次启动App，是否随机下载两组个性表情包，稍候也可在“我的”-“表情”中选择下载。" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                [self p_downloadDefaultExpression];
            }
        }];
    };
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lastRunDate.doubleValue];
    NSNumber *sponsorStatus = [[NSUserDefaults standardUserDefaults] objectForKey:@"sponsorStatus"];
    NSLog(@"今天第%ld次进入", sponsorStatus.integerValue);
    
    
    
}

// 下载表情包
- (void)p_downloadDefaultExpression {
    
}

@end
