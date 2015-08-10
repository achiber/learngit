//
//  WWHFirstViewController.m
//  WWHTabBarDemo
//
//  Created by albert on 15/8/7.
//  Copyright (c) 2015年 sj.com.wwh. All rights reserved.
//

#import "WWHFirstViewController.h"

@interface WWHFirstViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation WWHFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UILabel *)label
{
    if(!_label) {
        _label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"1";

    }
    return _label;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
