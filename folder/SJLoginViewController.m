

#import "SJLoginViewController.h"
// 3rd frameworks
#import <Masonry/Masonry.h>

@interface SJLoginViewController ()

    @property (nonatomic, strong) UITextField *accountTextField;
    @property (nonatomic, strong) UITextField *passwordTextField;
    @property (nonatomic, strong) UIButton *loginButton;

@end

@implementation SJLoginViewController
#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithWhite:0.95 alpha:1];
    // add subviews
    [self.view addSubview:self.accountTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf = self;
    // layout subviews
    [self.accountTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(40);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-40);
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(120);
        make.height.mas_equalTo(40);
    }];
    
    [self.passwordTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(40);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-40);
        make.top.mas_equalTo(weakSelf.accountTextField.mas_bottom).offset(40);
        make.height.mas_equalTo(40);
    }];
    
    [self.loginButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(40);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-40);
        make.top.mas_equalTo(weakSelf.passwordTextField.mas_bottom).offset(80);
        make.height.mas_equalTo(40);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)sj_loginButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark - Properties

- (UITextField *)accountTextField
{
    if (!_accountTextField) {
        _accountTextField = [[UITextField alloc] init];
        _accountTextField.backgroundColor = [UIColor whiteColor];
        _accountTextField.placeholder = @"请输入账号";
        _accountTextField.layer.cornerRadius = 3;
        _accountTextField.layer.borderWidth = 4;
        _accountTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _accountTextField;
}

- (UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.backgroundColor = [UIColor whiteColor];
        _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.secureTextEntry = YES;
        _passwordTextField.layer.cornerRadius = 3;
        _passwordTextField.layer.borderWidth = 4;
        _passwordTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _passwordTextField;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] init];
        _loginButton.backgroundColor = [UIColor whiteColor];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _loginButton.layer.cornerRadius = 3;
        _loginButton.layer.borderWidth = 1;
        _loginButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        // 绑定按钮触击事件方法
        [_loginButton addTarget:self action:@selector(sj_loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

@end












