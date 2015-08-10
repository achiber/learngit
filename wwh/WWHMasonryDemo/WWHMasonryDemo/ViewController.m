
#import "ViewController.h"

// 3rd frameworks
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *leftTopView;
@property (nonatomic, strong) UIView *rightTopView;
@property (nonatomic, strong) UIView *leftBottomView;
@property (nonatomic, strong) UIView *rightBottomView;
@property (nonatomic, strong) UIView *centerView;

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // add subviews
    [self.view addSubview:self.leftTopView];
    [self.view addSubview:self.rightTopView];
    [self.view addSubview:self.leftBottomView];
    [self.view addSubview:self.rightBottomView];
    [self.view addSubview:self.centerView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 在block中使用slef时可能出现retain cycle的现象，因此需要使用weakSelf
    __weak typeof(self) weakSelf = self;
    
    // layout subviews
    [self.leftTopView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(20); // 视图左侧到屏幕左侧的距离是20pt
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(20); // 视图顶部到屏幕顶部的距离是20pt
        make.size.mas_equalTo(CGSizeMake(100, 100)); // 视图的大小是 100pt * 100pt 的矩形
    }];
    
    [self.rightTopView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-20); // 视图右侧到屏幕右侧的距离是-20pt
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(20); // 视图顶部到屏幕顶部的距离是20pt
        make.size.mas_equalTo(CGSizeMake(100, 100)); // 视图的大小是 100pt * 100pt 的矩形
    }];
    
    [self.leftBottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(20); // 视图左侧到屏幕左侧的距离是20pt
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-20); // 视图底部到屏幕底部的距离是-20pt
        make.size.mas_equalTo(CGSizeMake(100, 100)); // 视图的大小是 100pt * 100pt 的矩形
    }];
    
    [self.rightBottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-20); // 视图右侧到屏幕右侧的距离是-20pt
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-20); // 视图底部到屏幕底部的距离是-20pt
        make.size.mas_equalTo(CGSizeMake(100, 100)); // 视图的大小是 100pt * 100pt 的矩形
    }];
    
    [self.centerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX); // 视图相对屏幕水平居中
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY); // 视图相对屏幕垂直居中
        make.size.mas_equalTo(CGSizeMake(100, 100)); // 视图的大小是 100pt * 100pt 的矩形
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Properties

- (UIView *)leftTopView
{
    if (!_leftTopView) {
        // 注意，当使用Masonry做布局时，初始化视图不需要传frame
        _leftTopView = [[UIView alloc] init];
        _leftTopView.backgroundColor = [UIColor redColor];
    }
    return _leftTopView;
}

- (UIView *)rightTopView
{
    if (!_rightTopView) {
        _rightTopView = [[UIView alloc] init];
        _rightTopView.backgroundColor = [UIColor blueColor];
    }
    return _rightTopView;
}

- (UIView *)leftBottomView
{
    if (!_leftBottomView) {
        _leftBottomView = [[UIView alloc] init];
        _leftBottomView.backgroundColor = [UIColor yellowColor];
    }
    return _leftBottomView;
}

- (UIView *)rightBottomView
{
    if (!_rightBottomView) {
        _rightBottomView = [[UIView alloc] init];
        _rightBottomView.backgroundColor = [UIColor greenColor];
    }
    return _rightBottomView;
}

- (UIView *)centerView
{
    if (!_centerView) {
        _centerView = [[UIView alloc] init];
        _centerView.backgroundColor = [UIColor grayColor];
    }
    return _centerView;
}

@end
