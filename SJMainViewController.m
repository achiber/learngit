
#import "SJMainViewController.h"
#import "SJLoginViewController.h"
// 3rd frameworks
#import <Masonry/Masonry.h>

@interface SJMainViewController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *exitButton;
@end

@implementation SJMainViewController
#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    // add subviews
    [self.view addSubview:self.label];
    [self.view addSubview:self.exitButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf = self;
    [self.exitButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(40);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-40);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-80);
        make.height.mas_equalTo(40);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (void)sj_exitButtonTapped:(id)sender
{
    SJLoginViewController *loginViewController = [[SJLoginViewController alloc] init];
    [self presentViewController:loginViewController animated:YES completion:^{
    }];
}

#pragma mark - Properties
- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _label.text = @"欢迎";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UIButton *)exitButton
{
    if (!_exitButton) {
        _exitButton = [[UIButton alloc] init];
        _exitButton.backgroundColor = [UIColor whiteColor];
        [_exitButton setTitle:@"退出" forState:UIControlStateNormal];
        [_exitButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_exitButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        _exitButton.layer.cornerRadius = 3;
        _exitButton.layer.borderWidth = 1;
        _exitButton.layer.borderColor = [UIColor redColor].CGColor;
        
        // 绑定按钮触击事件方法
        [_exitButton addTarget:self action:@selector(sj_exitButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitButton;
}

@end
