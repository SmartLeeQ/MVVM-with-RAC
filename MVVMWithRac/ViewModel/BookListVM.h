//
//  BookListVM.h
//  MVVMWithRac
//
//  Created by lixiaoqiang on 2018/7/3.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookListVM : NSObject
@property(nonatomic, strong)RACSubject *getListSuccess;
@property(nonatomic, strong)RACSubject *getListError;

- (void)getBookList;
@end
