//
//  NetWorkApi.m
//  MVVMWithRac
//
//  Created by lixiaoqiang on 2018/7/3.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import "NetWorkApi.h"
#import "NetWorKUtils.h"
#import "BookDto.h"
@implementation NetWorkApi
+ (RACSignal *)getBookList {
    NSString *url = @"https://api.douban.com/v2/book/search?q=ios&fields=id,title";
    return [[[NetWorKUtils sharedNetWorKUtils] getWithURL:url] map:^id(id value) {
        NSArray<BookDto *> *arr = [MTLJSONAdapter modelsOfClass:[BookDto class] fromJSONArray:value[@"books"] error:nil];
        return arr;
    }];
}
@end
