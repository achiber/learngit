

#import "WWHSecondViewController.h"

// 3rd freamworks
#import <Masonry/Masonry.h>

@interface WWHSecondViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation WWHSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    // add subviews
    [self.view addSubview:self.label];
    [self.view addSubview:self.cancelButton];
    
    if (self.navigationController) {
        self.cancelButton.hidden = YES;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY);
    }];
    
    [self.cancelButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 45));
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-20);
    }];
}

#pragma mark - Actions

- (void)sj_cancelButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark - Properties

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _label.text = @"2";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];
        _cancelButton.layer.cornerRadius = 3;
        _cancelButton.layer.borderWidth = 1;
        _cancelButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        // 绑定按钮触击的响应方法   UIControlEventTouchDown  UIControlEventTouchUpInside  UIControlEventTouchUpOutside
        //       [_cancelButton addTarget:self action:@selector(sj_cancelButtonTapped:) forControlEvents:UIControlEventTouchDown];
        [_cancelButton addTarget:self action:@selector(sj_cancelButtonTapped:) forControlEvents: UIControlEventTouchUpInside];
        
    }
    return _cancelButton;
}

@end
