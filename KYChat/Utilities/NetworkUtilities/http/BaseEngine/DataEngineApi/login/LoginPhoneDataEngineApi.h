//
//  LoginPhoneDataEngineApi.h
//  KYChat
//
//  Created by ITD on 2017/4/6.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "YABaseDataEngine.h"

@interface LoginPhoneDataEngineApi : YABaseDataEngine

+ (YABaseDataEngine *)control:(NSObject *)control
                  phoneNumber:(NSString *)phoneNumber
                     passWord:(NSString *)passWord
                     complete:(CompletionDataBlock)responseBlock;


@end
