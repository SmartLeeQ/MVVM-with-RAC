//
//  BookDto.m
//  MVVMWithRac
//
//  Created by lixiaoqiang on 2018/7/3.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import "BookDto.h"

@implementation BookDto
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"ID":@"id",
             @"title":@"title"
             };
}
@end
