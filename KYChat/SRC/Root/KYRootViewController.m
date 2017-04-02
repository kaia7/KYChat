//
//  KYRootViewController.m
//  KYChat
//
//  Created by ITD on 2017/3/31.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "KYRootViewController.h"
#import "KYConversationViewController.h"
#import "KYFrieldsViewController.h"
#import "KYDiscoverViewController.h"
#import "KYMineViewController.h"

static KYRootViewController *rootVC = nil;

@interface KYRootViewController ()

@property (nonatomic, strong) NSArray *childVCArray;

@property (nonatomic, strong) KYConversationViewController *conversationVC;
@property (nonatomic, strong) KYFrieldsViewController *friendVC;
@property (nonatomic, strong) KYDiscoverViewController *discoverVC;
@property (nonatomic, strong) KYMineViewController *mineVC;

@end

@implementation KYRootViewController

+ (KYRootViewController *) sharedRootViewController
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rootVC = [[KYRootViewController alloc] init];
    });
    return  rootVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setViewControllers:self.childVCArray];   //初始化子控制器
    
}
- (id)childViewControllerAtIndex:(NSUInteger)index
{
    return [[self.childViewControllers objectAtIndex:index] rootViewController];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [(UINavigationController *)self.childViewControllers[self.selectedIndex] pushViewController:viewController animated:animated];
}



#pragma mark - Getterr

- (NSArray *) childVCArray {
    
    if (_childVCArray == nil ) {
        KYNavigationController *convNavC = [[KYNavigationController alloc] initWithRootViewController:self.conversationVC];
        KYNavigationController *friendNavC = [[KYNavigationController alloc] initWithRootViewController:self.friendVC];
        KYNavigationController *discoverNavC = [[KYNavigationController alloc] initWithRootViewController:self.discoverVC];
        KYNavigationController *mineNavC = [[KYNavigationController alloc] initWithRootViewController:self.mineVC];
        
        _childVCArray = @[convNavC,friendNavC,discoverNavC,mineNavC];
        
    }
    return _childVCArray;
    
}

- (KYConversationViewController *) conversationVC
{
    if (_conversationVC == nil) {
        _conversationVC = [[KYConversationViewController alloc] init];
        [_conversationVC.tabBarItem setTitle:@"消息"];
        [_conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_conversationVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _conversationVC;
}

- (KYFrieldsViewController *) friendsVC
{
    if (_friendVC == nil) {
        _friendVC = [[KYFrieldsViewController alloc] init];
        [_friendVC.tabBarItem setTitle:@"通讯录"];
        [_friendVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
        [_friendVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    }
    return _friendVC;
}

- (KYDiscoverViewController *) discoverVC
{
    if (_discoverVC == nil) {
        _discoverVC = [[KYDiscoverViewController alloc] init];
        [_discoverVC.tabBarItem setTitle:@"发现"];
        [_discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
        [_discoverVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    }
    return _discoverVC;
}

- (KYMineViewController *) mineVC
{
    if (_mineVC == nil) {
        _mineVC = [[KYMineViewController alloc] init];
        [_mineVC.tabBarItem setTitle:@"我"];
        [_mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
        [_mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    }
    return _mineVC;
}




@end
