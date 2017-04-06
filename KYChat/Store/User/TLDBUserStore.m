//
//  TLDBUserStore.m
//  KYChat
//
//  Created by ITD on 2017/4/6.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "TLDBUserStore.h"
#import "TLDBUserStoreSQL.h"

@implementation TLDBUserStore

- (id)init {
    if (self = [super init]) {
        self.dbQueue = [TLDBManager sharedInstance].commonQueue;
        BOOL ok = [self createTable];
        if (!ok) {
            DDLogError(@"DB: 用户表创建失败");
        }
    }
    return self;
}

- (BOOL)createTable {
    NSString *sqlString = [NSString stringWithFormat:SQL_CRESTE_USER_TABLE,USER_TABLE_NAME];
    return [self createTable:USER_TABLE_NAME withSQL:sqlString];
}

/**
 *  更新用户信息
 */
- (BOOL)updateUser:(TLUser *)user
{
    NSString *sqlString = [NSString stringWithFormat:SQL_UPDATE_USER, USER_TABLE_NAME];
    NSArray *arrPara = [NSArray arrayWithObjects:
                        KYNoNilString(user.userID),
                        KYNoNilString(user.username),
                        KYNoNilString(user.nikeName),
                        KYNoNilString(user.avatarURL),
                        KYNoNilString(user.remarkName),
                        @"", @"", @"", @"", @"", nil];
    BOOL ok = [self excuteSQL:sqlString withArrParameter:arrPara];
    return ok;
}

/**
 *  获取用户信息
 */

- (TLUser *)userByID:(NSString *)userID
{
    NSString *sqlString = [NSString stringWithFormat:SQL_SELECT_USER_BY_ID, USER_TABLE_NAME, userID];
    __block TLUser * user;
    [self excuteQuerySQL:sqlString resultBlock:^(FMResultSet *retSet) {
        while ([retSet next]) {
            user = [self p_createUserByFMResultSet:retSet];
        }
        [retSet close];
    }];
    return user;
}

- (BOOL)deleteUsersByUid:(NSString *)uid
{
    NSString *sqlString = [NSString stringWithFormat:SQL_DELETE_USER, USER_TABLE_NAME, uid];
    BOOL ok = [self excuteSQL:sqlString, nil];
    return ok;
}



#pragma mark - # Private Methods
- (TLUser *)p_createUserByFMResultSet:(FMResultSet *)retSet
{
    TLUser *user = [[TLUser alloc] init];
    user.userID = [retSet stringForColumn:@"uid"];
    user.username = [retSet stringForColumn:@"username"];
    user.nikeName = [retSet stringForColumn:@"nikename"];
    user.avatarURL = [retSet stringForColumn:@"avatar"];
    user.remarkName = [retSet stringForColumn:@"remark"];
    return user;
}



@end
