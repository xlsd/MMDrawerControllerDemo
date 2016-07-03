//
//  LeftViewController.m
//  调试
//
//  Created by 薛林 on 16/7/1.
//  Copyright © 2016年 xuelin. All rights reserved.
//

#import "LeftViewController.h"
#import "TestViewController.h"
#import "AppDelegate.h"
#import "Header.h"

@interface LeftViewController ()

@end

@implementation LeftViewController
#pragma mark - 视图即将出现

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //加载tableViewHeader xib
    self.tableView.tableHeaderView = [Header headerLoad];
    
    //禁止滚动
    self.tableView.scrollEnabled = NO;
    
}

#pragma mark - 数据源方法
//确定行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
    
}

//确定cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"小林子";
    
    return cell;
}

#pragma mark - 选中跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建子控制器
    TestViewController *testVc = [TestViewController new];
    
    //跳转
    [self.navigationController pushViewController:testVc animated:YES];

}

@end
