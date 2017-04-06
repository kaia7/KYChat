//
//  LoginPhoneDataEngineApi.m
//  KYChat
//
//  Created by ITD on 2017/4/6.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "LoginPhoneDataEngineApi.h"

@implementation LoginPhoneDataEngineApi

+ (YABaseDataEngine *)control:(NSObject *)control
                    phoneNumber:(NSString *)phoneNumber
                     passWord:(NSString *)passWord
                     complete:(CompletionDataBlock)responseBlock
{

    NSDictionary *param = @{@"phone":@"18674809442",
                            @"pwd":@"123456"};
    return [YABaseDataEngine control:control callAPIWithServiceType:YAServiceFWZ path:@"servers/LoginNew.ashx" param:param requestType:YAAPIManagerRequestTypeGet alertType:DataEngineAlertType_None progressBlock:nil complete:responseBlock errorButtonSelectIndex:nil];
}

@end
