//
//  CheckAppStroeDataEngine.m
//  yybjproject
//
//  Created by kky on 16/12/26.
//  Copyright © 2016年 bingjun. All rights reserved.
//

#import "CheckAppStroeDataEngine.h"

@implementation CheckAppStroeDataEngine

+ (YABaseDataEngine *)control:(NSObject *)control
                     complete:(CompletionDataBlock)responseBlock
{
    //baike.baidu.com/api/openapi/BaikeLemmaCardApi?scope=103&format=json&appid=379020&bk_key=%E5%85%B3%E9%94%AE%E5%AD%97&bk_length=600
    NSDictionary *param = @{};
    return [YABaseDataEngine control:control callAPIWithServiceType:YAServiceFWZ path:@"accountSystemAction/checkAppStroeV16.do" param:param requestType:YAAPIManagerRequestTypeGet alertType:DataEngineAlertType_None progressBlock:nil complete:responseBlock errorButtonSelectIndex:nil];
}

@end
