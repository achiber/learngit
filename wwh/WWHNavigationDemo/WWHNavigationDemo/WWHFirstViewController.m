
#import "WWHFirstViewController.h"
// view controllers
#import "WWHSecondViewController.h"
// 3rd freamworks
#import <Masonry/Masonry.h>

@interface WWHFirstViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *pushButton;
@property (nonatomic, strong) UIButton *modalButton;

@end


@implementation WWHFirstViewController
#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    // add subviews
    [self.view addSubview:self.label];
    [self.view addSubview:self.pushButton];
    [self.view addSubview:self.modalButton];
}
#pragma mark viewWillAppear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf = self;
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY);
    }];
    
    [self.pushButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 45));
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-120);
    }];
    
    [self.modalButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 45));
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-20);
    }];
}
#pragma mark didReceiveMemoryWarning
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (void)sj_pushButtonTapped:(id)sender
{
    WWHSecondViewController *secondViewController = [[WWHSecondViewController alloc] init];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)sj_modalButtonTapped:(id)sender
{
    WWHSecondViewController *secondViewController = [[WWHSecondViewController alloc] init];
    [self presentViewController:secondViewController animated:YES completion:^{
    }];
}

#pragma mark - Properties
#pragma mark label
- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _label.text = @"1";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

#pragma mark pushButton
- (UIButton *)pushButton
{
    if (!_pushButton) {
        _pushButton = [[UIButton alloc] init];
        [_pushButton setTitle:@"Push" forState:UIControlStateNormal];
        [_pushButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_pushButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];
        _pushButton.layer.cornerRadius = 3;
        _pushButton.layer.borderWidth = 1;
        _pushButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        // 绑定按钮触击的响应方法
        [_pushButton addTarget:self action:@selector(sj_pushButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}
#pragma mark modalButton
- (UIButton *)modalButton
{
    if (!_modalButton) {
        _modalButton = [[UIButton alloc] init];
        [_modalButton setTitle:@"Modal" forState:UIControlStateNormal];
        [_modalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_modalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _modalButton.layer.cornerRadius = 3;
        _modalButton.layer.borderWidth = 1;
        _modalButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        // 绑定按钮触击的响应方法
        [_modalButton addTarget:self action:@selector(sj_modalButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _modalButton;
}

@end
