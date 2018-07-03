//
//  BookListViewController.m
//  MVVMWithRac
//
//  Created by lixiaoqiang on 2018/7/3.
//  Copyright © 2018年 lixiaoqiang. All rights reserved.
//

#import "BookListViewController.h"
#import "BookListVM.h"
#import "BookDto.h"
@interface BookListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)BookListVM *bookListVM;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *arr;
@end

@implementation BookListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"书籍";
    self.bookListVM = [[BookListVM alloc] init];
    @weakify(self)
    [self.bookListVM.getListSuccess subscribeNext:^(NSArray *x) {
        @strongify(self)
        self.arr = x;
        [self.tableView reloadData];
    }];
    
    [self.bookListVM.getListError subscribeError:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    [self.bookListVM getBookList];
    [self setUpViews];
}
- (void)setUpViews {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    if (indexPath.row < self.arr.count) {
        BookDto *dto = self.arr[indexPath.row];
        cell.textLabel.text = dto.title ? dto.title :@"";
    }
    return cell;
}
- (void)close {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)dealloc {
    NSLog(@"销毁了");
}
@end
