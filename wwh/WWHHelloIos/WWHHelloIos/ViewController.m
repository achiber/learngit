//
//  ViewController.m
//  WWHHelloIos
//
//  Created by albert on 15/8/3.
//  Copyright (c) 2015年 sj.com.wwh. All rights reserved.

#import "ViewController.h"
@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController
#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super viewDidLoad];
    // 设置整屏的背景颜色
    self.view.backgroundColor = [UIColor greenColor];
    // add subviews
    [self.view addSubview:self.label];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super viewWillAppear:animated];
    // do your work ...
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super viewDidAppear:animated];
    // do your work ...
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    // do your work ...
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    // do your work ...
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super didReceiveMemoryWarning];
    // do your work ...
}

#pragma mark - Properties

- (UILabel *)label
{
    if (!_label) {
        
        // 通过frame来确定控件（视图）在屏幕上得位置
        _label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //横宽竖高
        _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 40)]; // 试试把注释去掉，然后看看显示有什么不同
        _label.text = @"Hello, wwh!";
        // 文字居中
        _label.textAlignment = NSTextAlignmentCenter;
        // 显示边框
        _label.layer.borderColor = [UIColor redColor].CGColor;
        _label.layer.borderWidth = 3;
    }
    return _label;
}

@end