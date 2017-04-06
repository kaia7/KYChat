//
//  TLDBUserStore.h
//  KYChat
//
//  Created by ITD on 2017/4/6.
//  Copyright © 2017年 凯  赵. All rights reserved.
//

#import "TLDBBaseStore.h"

@interface TLDBUserStore : TLDBBaseStore

/**
 *  更新用户信息
 */
- (BOOL)updateUser:(TLUser *)user;

/**
 *  获取用户信息
 */
- (TLUser *)userByID:(NSString *)userID;

/**
 *  查询所有用户
 */

- (NSArray *)userData;
/**
 *  删除用户
 */
- (BOOL)deleteUsersByUid:(NSString *)uid;


@end
