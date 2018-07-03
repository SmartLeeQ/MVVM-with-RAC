//
//  BookDto.h
//  MVVMWithRac
//
//  Created by lixiaoqiang on 2018/7/3.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface BookDto : MTLModel<MTLJSONSerializing>
@property(nonatomic, strong)NSString *ID;
@property(nonatomic, strong)NSString *title;
@end
