//
//  NetWorKUtils.h
//  MVVMWithRac
//
//  Created by lixiaoqiang on 2018/7/2.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorKUtils : NSObject
+ (NetWorKUtils *)sharedNetWorKUtils;
- (RACSignal *)postWithhURL:(NSString *)url params:(NSDictionary *)params;
- (RACSignal *)getWithURL:(NSString *)url;
@end
