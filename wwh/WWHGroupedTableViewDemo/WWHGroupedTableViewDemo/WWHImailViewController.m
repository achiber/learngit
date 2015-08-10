
#import "WWHImailViewController.h"

@interface WWHImailViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation WWHImailViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"即时邮件";
    NSLog(@"%@", self.class);
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
        _label.text = @"即时邮件";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end
