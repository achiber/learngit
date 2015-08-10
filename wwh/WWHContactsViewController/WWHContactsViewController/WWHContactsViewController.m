#import "WWHContactsViewController.h"

// models
#import "WWHContact.h"

// cells
#import "WWHContactsTableViewCell.h"

// 3rd frameworks
#import <Masonry/Masonry.h>

@interface WWHContactsViewController () <UITableViewDataSource, UITableViewDelegate>

// data
@property (nonatomic, strong) NSMutableArray *contacts;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation WWHContactsViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // add subviews
    [self.view addSubview:self.tableView];
    
    // Data from `contacts.json`
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *contactsDicts = rootDict[@"contacts"];
    
    // Convert to `KLFriend`
    NSMutableArray *entities = @[].mutableCopy;
    [contactsDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        WWHContact *contact = [[WWHContact alloc] init];
        contact.avatarImageName = obj[@"avatarImageName"];
        contact.name = obj[@"name"];
        contact.signature = obj[@"signature"];
        contact.onlineStatus = obj[@"onlineStatus"];
        
        [entities addObject:contact];
    }];
    
    self.contacts = entities;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 构建cell
    WWHContactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WWHContactsTableViewCell class])];
    if (!cell) {
        cell = [[WWHContactsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([WWHContactsTableViewCell class])];
    }
    cell.contact = [self.contacts objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

#pragma mark - Properties

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        _tableView.rowHeight = 49;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
