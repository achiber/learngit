//
//  ViewController.m
//  SJGroupedTableViewDemo
//
//  Created by JI Yixuan on 15/8/5.
//  Copyright (c) 2015年 sj. All rights reserved.
//

#import "ViewController.h"

// controllers
#import "WWHMeViewController.h"
#import "WWHImailViewController.h"
#import "WWHGroupMessagingViewController.h"
#import "WWHImportantMessagingViewController.h"

// 3rd frameworks
#import <Masonry/Masonry.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 设置导航栏标题
    self.title = @"更多";
    // add subviews
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf = self;
    // layout subviews
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right);
        make.top.mas_equalTo(weakSelf.view.mas_top);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 3;
    }
    else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
      //  cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
NSLog(@"%@", [UITableViewCell class]);
NSLog(@"%@", NSStringFromClass([UITableViewCell class]));
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 右箭头
    if (indexPath.section == 0) {
        cell.textLabel.text = @"我";
        cell.imageView.image = [UIImage imageNamed:@"IconMoreMe"];
    }
    else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                cell.textLabel.text = @"即时邮件";
                cell.imageView.image = [UIImage imageNamed:@"IconMoreImail"];
                break;
            }
                
            case 1:
            {
                cell.textLabel.text = @"群发消息";
                cell.imageView.image = [UIImage imageNamed:@"IconMoreGroupMessaging"];
                break;
            }
                
            case 2:
            {
                cell.textLabel.text = @"重要消息";
                cell.imageView.image = [UIImage imageNamed:@"IconMoreImportantMessaging"];
                break;
            }
                
            default:
                break;
        }
    }
    return cell;
}

#pragma mark - UITableViewDelegate

// 选中某一行后触发
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        // push → 屏.我
        WWHMeViewController *meViewController = [[WWHMeViewController alloc] init];
        [self.navigationController pushViewController:meViewController animated:YES];
    }
    else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                // push → 屏.即时邮件
                WWHImailViewController *imailViewController = [[WWHImailViewController alloc] init];
                [self.navigationController pushViewController:imailViewController animated:YES];
                break;
            }
            case 1:
            {
                // push → 屏.群发消息
                WWHGroupMessagingViewController *groupMessagingViewController = [[WWHGroupMessagingViewController alloc] init];
                [self.navigationController pushViewController:groupMessagingViewController animated:YES];
                break;
            }
            case 2:
            {
                // push → 屏.重要消息
                WWHImportantMessagingViewController *importantMessagingViewController = [[WWHImportantMessagingViewController alloc] init];
                [self.navigationController pushViewController:importantMessagingViewController animated:YES];
                break;
            }
            default:
                break;
        }
    }
}

#pragma mark - Properties
- (UITableView *)tableView
{
    if (!_tableView) {
        NSLog(@"%@", [ViewController class]);
//        CGRect rect = CGRectMake(200, 200, 100, 100);
        _tableView = [[UITableView alloc] initWithFrame: CGRectZero style:UITableViewStyleGrouped]; // UITableView有两种style，默认是UITableViewStylePlain
      //  _tableView= [[UITableView alloc] initWithFrame:CGRectZero style: UITableViewStylePlain];
     //   NSLog(@"%lf, %lf, %lf, %lf", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
