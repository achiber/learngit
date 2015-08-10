//
//  SJMeViewController.m
//  SJGroupedTableViewDemo
//
//  Created by JI Yixuan on 15/8/5.
//  Copyright (c) 2015年 sj. All rights reserved.

#import "WWHMeViewController.h"

@interface WWHMeViewController ()
@property (nonatomic, strong) UILabel *label;
@end


@implementation WWHMeViewController
#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    self.view.backgroundColor = [UIColor greenColor];
    // add subviews
    [self.view addSubview:self.label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Properties

- (UILabel *)label {
    if (!_label) {
       // _label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _label = [[UILabel alloc] initWithFrame:CGRectMake(70, 100, 200, 50)];
        
        _label.font = [UIFont fontWithName:@"Arial" size:30];
        _label.text = @"albert";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor redColor];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end
