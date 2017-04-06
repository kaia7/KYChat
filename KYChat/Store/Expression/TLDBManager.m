//
//  TLDManager.m
//  KYChat
//
//  Created by ITD on 2017/4/6.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "TLDBManager.h"
static TLDBManager *manager;

@implementation TLDBManager

+ (TLDBManager *)sharedInstance {
    static dispatch_once_t onceToken;
    NSString *userID = [KYUserHelper shareHelper].userID;
    dispatch_once(&onceToken, ^{
//        manager = [[TLDBManager alloc] init];
        manager = [[TLDBManager alloc] initWithUserID:userID];
    });
    return manager;
}

#pragma mark - # Private Method

- (id)initWithUserID:(NSString *)userID {
    
    if (self == [super init]) {
        
        NSString *commonQueuePath = [NSFileManager pathDBCommon];
        self.commonQueue = [FMDatabaseQueue databaseQueueWithPath:commonQueuePath];
        
        NSString *messageQueuePath = [NSFileManager pathDBMessage];
        self.messageQueue = [FMDatabaseQueue databaseQueueWithPath:messageQueuePath];
        
    }
    return self;
}

- (id)init {
    DDLogError(@"TLDBManager：请使用 initWithUserID: 方法初始化");
    return nil;
}

@end
