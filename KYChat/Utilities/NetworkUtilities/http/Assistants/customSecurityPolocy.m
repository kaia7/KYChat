//
//  customSecurityPolocy.m
//  NetWorking
//
//  Created by kky on 16/12/15.
//  Copyright © 2016年 Yasin. All rights reserved.
//

#import "customSecurityPolocy.h"

@implementation customSecurityPolocy

+ (AFSecurityPolicy*)customSecurityPolicy {
    //证书路径
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"hognrendiandian" ofType:@"cer"];
    NSData *cerdata = [NSData dataWithContentsOfFile:cerPath];
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolocy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolocy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolocy.validatesDomainName = NO;
    
    NSSet *set = [[NSSet alloc] initWithObjects:cerdata, nil];
    
    securityPolocy.pinnedCertificates = set;  // @[cerdata]
    
    return securityPolocy;
    
}

@end
