
//
//  KYUserHelper.m
//  KYChat
//
//  Created by ITD on 2017/4/3.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "KYUserHelper.h"

@implementation KYUserHelper
@synthesize user = _user;

+ (KYUserHelper *)shareHelper {
    
    static KYUserHelper *helper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[KYUserHelper alloc] init];
    });
    return helper;
}

- (void)loginTestAccount
{
    TLUser *user = [[TLUser alloc] init];
    user.userID = @"1000";
    user.avatarURL = @"http://p1.qq181.com/cms/120506/2012050623111097826.jpg";
    user.nikeName = @"李伯坤";
    user.username = @"li-bokun";
    user.detailInfo.qqNumber = @"1159197873";
    user.detailInfo.email = @"libokun@126.com";
    user.detailInfo.location = @"山东 滨州";
    user.detailInfo.sex = @"男";
    user.detailInfo.motto = @"Hello world!";
    user.detailInfo.momentsWallURL = @"http://img06.tooopen.com/images/20160913/tooopen_sy_178786212749.jpg";
    
    [self setUser:user];
}

- (void)setUser:(TLUser *)user
{
    _user = user;
//    TLDBUserStore *userStore = [[TLDBUserStore alloc] init];
//    if (![userStore updateUser:user]) {
//        DDLogError(@"登录数据存库失败");
//    }
    
    [[NSUserDefaults standardUserDefaults] setObject:user.userID forKey:@"loginUid"];
}

- (TLUser *)user
{
//    if (!_user) {
//        if (self.userID.length > 0) {
//            TLDBUserStore *userStore = [[TLDBUserStore alloc] init];
//            _user = [userStore userByID:self.userID];
//            if (!_user) {
//                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"loginUid"];
//            }
//        }
//    }
    return _user;
}

- (NSString *)userID
{
    NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginUid"];
    return uid;
}

- (BOOL)isLogin
{
    return self.user.userID.length > 0;
}




@end
