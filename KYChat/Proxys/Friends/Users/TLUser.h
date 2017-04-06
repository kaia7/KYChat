//
//  TLUser.h
//  TLChat
//
//  Created by 李伯坤 on 16/1/23.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLBaseDataModel.h"
#import "TLUserDetail.h"
#import "TLUserSetting.h"
#import "TLUserChatSetting.h"

@interface TLUser : TLBaseDataModel

/// 用户ID
@property (nonatomic, strong) NSString *userID;

/// 用户名
@property (nonatomic, strong) NSString *username;

/// 昵称
@property (nonatomic, strong) NSString *nikeName;

/// 头像URL
@property (nonatomic, strong) NSString *avatarURL;

/// 头像Path
@property (nonatomic, strong) NSString *avatarPath;

/// 备注名
@property (nonatomic, strong) NSString *remarkName;

/// 界面显示名称
@property (nonatomic, strong, readonly) NSString *showName;

#pragma mark # add by kky
/// 界面显示名称
@property (nonatomic, copy) NSString *DptName;

@property (nonatomic, copy) NSString * DptNo;

@property (nonatomic, copy) NSString *EmpIDNo;

@property (nonatomic, copy) NSString *EmpName;

@property (nonatomic, copy) NSString *EmployeeNO;

@property (nonatomic, copy) NSString *TitName;

@property (nonatomic, copy) NSString *TitNo;

@property (nonatomic, copy) NSString *USR_Name;

@property (nonatomic, copy) NSString *USR_PWD;

@property (nonatomic, copy) NSString *USR_Phone;

@property (nonatomic, copy) NSString *hasPC;

@property (nonatomic, copy) NSString *isValid;

@property (nonatomic, copy) NSString *jobNo;

@property (nonatomic, copy) NSString *jobname;

@property (nonatomic, copy) NSString *upCerImg;



#pragma mark - 其他
@property (nonatomic, strong) TLUserDetail *detailInfo;

@property (nonatomic, strong) TLUserSetting *userSetting;

@property (nonatomic, strong) TLUserChatSetting *chatSetting;


#pragma mark - 列表用
/**
 *  拼音  
 *
 *  来源：备注 > 昵称 > 用户名
 */
@property (nonatomic, strong) NSString *pinyin;

@property (nonatomic, strong) NSString *pinyinInitial;

@end
