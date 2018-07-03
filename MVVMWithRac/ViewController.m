//
//  ViewController.m
//  MVVMWithRac
//
//  Created by lixiaoqiang on 2018/7/2.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import "ViewController.h"

#import "BookListViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[BookListViewController new]];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
