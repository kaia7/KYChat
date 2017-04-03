//
//  KYUserHelper.h
//  KYChat
//
//  Created by ITD on 2017/4/3.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLUser.h"

@interface KYUserHelper : NSObject

@property (nonatomic, strong) TLUser *user;

@property (nonatomic, strong, readonly) NSString *userID;

@property (nonatomic, assign, readonly) BOOL isLogin;

+ (KYUserHelper *)shareHelper;

- (void)loginTestAccount;


@end
