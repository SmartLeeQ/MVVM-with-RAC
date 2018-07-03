//
//  BookListVM.m
//  MVVMWithRac
//
//  Created by lixiaoqiang on 2018/7/3.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import "BookListVM.h"
#import "NetWorkApi.h"
@implementation BookListVM
- (instancetype)init {
    self = [super init];
    if (self) {
        self.getListSuccess = [RACSubject new];
        self.getListError = [RACSubject new];
    }
    return self;
}
- (void)getBookList {
    [[NetWorkApi getBookList] subscribeNext:^(id x) {
        [self.getListSuccess sendNext:x];
    } error:^(NSError *error) {
        [self.getListError sendError:error];
    }];
}
@end
