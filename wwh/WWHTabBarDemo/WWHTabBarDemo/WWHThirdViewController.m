
#import "WWHThirdViewController.h"

@interface WWHThirdViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation WWHThirdViewController
#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
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
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"3";
    }
    return _label;
}

@end
