//
//  RightViewController.m
//  调试
//
//  Created by 薛林 on 16/7/1.
//  Copyright © 2016年 xuelin. All rights reserved.
//

#import "RightViewController.h"
#import <UIViewController+MMDrawerController.h>
#import <Masonry.h>
#import "TestViewController.h"
@interface RightViewController ()

@end

@implementation RightViewController

#pragma mark - 隐藏导航控制器
- (void)viewWillAppear:(BOOL)animated {
    //加载界面是隐藏导航控制器
    [self.navigationController setNavigationBarHidden:YES];
    
}

#pragma mark - 显示导航控制器
- (void)viewWillDisappear:(BOOL)animated {
    //界面即将消失时显示导航控制器
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景色
    self.view.backgroundColor = [UIColor blueColor];
    
    //自定义中间导航控制器
    [self custumView];
}


#pragma mark - 自定center控制器的navigationBar

- (void)custumView {
    
    //自定义center控制器的导航控制器的view
    UIView *viewBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    
    //设置navigationBar的背景图片
    viewBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"anniu"]];
    
    //左侧按钮
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 30,24, 24)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"u73"] forState:
     UIControlStateNormal];
    
    //设置圆角
    [leftButton setBackgroundColor:[UIColor whiteColor]];
    leftButton.layer.cornerRadius = 12;
    leftButton.layer.masksToBounds = YES;
    //添加事件
    [leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //添加
    [viewBar addSubview:leftButton];
    
    //右侧按钮
    UIButton *rightButton = [[UIButton alloc]init];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"u73"] forState:UIControlStateNormal];
    
    //设置圆角
    [rightButton setBackgroundColor:[UIColor whiteColor]];
    rightButton.layer.cornerRadius = 10;
    rightButton.layer.masksToBounds = YES;
    
    [rightButton addTarget:self action:@selector(rightItemClick) forControlEvents:UIControlEventTouchUpInside];
    //添加
    [viewBar addSubview:rightButton];
    
    //设置右侧按钮的约束
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewBar).with.offset(30);
        make.right.equalTo(viewBar).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    //添加首页标签
    UILabel *titleLabel = [[UILabel alloc]init];
    
    titleLabel.text = @"测试";
    
    [titleLabel setTextColor:[UIColor whiteColor]];
    
    titleLabel.font = [UIFont systemFontOfSize:18];
    [viewBar addSubview:titleLabel];
    
    //添加约束
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewBar).with.offset(22);
        make.centerX.equalTo(viewBar);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    //添加
    [self.view addSubview:viewBar];
    
}

#pragma mark - 点击收回/打开MMDrawerSide
- (void)back{
    //判断是否打开Side
    if (!self.mm_drawerController.openSide) {
        //打开
        [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        }];
    }
    //关闭
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        
    }];
}
#pragma mark - 右侧按钮点击事件
- (void)rightItemClick {
    
    //创建子控制器
    TestViewController *testVc = [TestViewController new];
    
    //跳转
    [self.navigationController pushViewController:testVc animated:YES];
}

@end
