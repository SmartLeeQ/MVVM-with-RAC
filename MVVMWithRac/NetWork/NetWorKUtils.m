//
//  NetWorKUtils.m
//  MVVMWithRac
//
//  Created by lixiaoqiang on 2018/7/2.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import "NetWorKUtils.h"

@implementation NetWorKUtils

static NetWorKUtils *sharedAFNetWorkUtils = nil;
static dispatch_once_t pred;

+ (NetWorKUtils *)sharedNetWorKUtils {
    dispatch_once(&pred, ^{
        sharedAFNetWorkUtils = [[super allocWithZone:NULL] init];
    });
    return sharedAFNetWorkUtils;
}
+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedNetWorKUtils];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}
/**
 * 创建网络请求管理类单例对象
 */
- (AFHTTPSessionManager *)sharedHTTPSessionManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer new];
        manager.requestSerializer.timeoutInterval = 20.f;//超时时间为20s
        NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
        [acceptableContentTypes addObject:@"text/plain"];
        [acceptableContentTypes addObject:@"text/html"];
        manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    });
    return manager;
}
#pragma mark -RAC

/**
 *  转换成响应式请求 可重用
 *
 *  @param url   请求地址
 *  @param params 请求参数
 *
 *  @return 带请求结果（字典）的信号
 */
- (RACSignal *)postWithhURL:(NSString *)url params:(NSDictionary *)params {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AFHTTPSessionManager *manager = [self sharedHTTPSessionManager];
        NSURLSessionDataTask *task = [manager POST:url parameters:params constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}
- (RACSignal *)getWithURL:(NSString *)url {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AFHTTPSessionManager *manager = [self sharedHTTPSessionManager];
        NSURLSessionDataTask *task = [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}
@end
