//
//  CheckAppStroeDataEngine.h
//  yybjproject
//
//  Created by kky on 16/12/26.
//  Copyright © 2016年 bingjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YABaseDataEngine.h"

@interface CheckAppStroeDataEngine : NSObject

+ (YABaseDataEngine *)checkAppStroecontrol:(NSObject *)control
                     complete:(CompletionDataBlock)responseBlock;

@end
