//
//  customSecurityPolocy.h
//  NetWorking
//
//  Created by kky on 16/12/15.
//  Copyright © 2016年 Yasin. All rights reserved.
//

#import "AFNetworking.h"
/***
 AFNetworking 对数据进行https ssl加密
 ***/
@interface customSecurityPolocy : AFSecurityPolicy

+ (AFSecurityPolicy*)customSecurityPolicy;


@end
