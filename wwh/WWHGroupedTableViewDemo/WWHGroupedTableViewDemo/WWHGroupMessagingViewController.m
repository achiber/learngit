//
//  SJGroupMessagingViewController.m
//  SJGroupedTableViewDemo
//
//  Created by JI Yixuan on 15/8/5.
//  Copyright (c) 2015年 sj. All rights reserved.
//

#import "WWHGroupMessagingViewController.h"

@interface WWHGroupMessagingViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation WWHGroupMessagingViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"群发消息";
    self.view.backgroundColor = [UIColor whiteColor];
    // add subviews
    [self.view addSubview:self.label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Properties

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _label.text = @"群发消息";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end
