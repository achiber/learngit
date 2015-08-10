
#import "WWHContactsTableViewCell.h"

// 3rd frameworks
#import <Masonry/Masonry.h>

@implementation WWHContactsTableViewCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // add subviews
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.signatureLabel];
        [self.contentView addSubview:self.onlineStatusLabel];
        
        __weak typeof(self) weakSelf = self;
        
        // layout subviews
        [self.avatarImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.contentView.mas_left).offset(10);
            make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
        
        [self.nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.contentView.mas_top).offset(7);
            make.left.mas_equalTo(weakSelf.avatarImageView.mas_right).offset(10);
        }];
        
        [self.signatureLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.nameLabel.mas_right).offset(10);
            make.right.mas_lessThanOrEqualTo(weakSelf.contentView.mas_right).offset(-10);
            make.centerY.mas_equalTo(weakSelf.nameLabel.mas_centerY);
        }];
        
        [self.onlineStatusLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.nameLabel.mas_bottom).offset(10);
            make.left.mas_equalTo(weakSelf.avatarImageView.mas_right).offset(10);
            make.right.mas_equalTo(weakSelf.contentView.mas_right).offset(-10);
        }];
    }
    return self;
}

#pragma mark - Properties

- (void)setContact:(WWHContact *)contact
{
    _contact = contact;
    
    if (contact.avatarImageName.length > 0) {
        self.avatarImageView.image = [UIImage imageNamed:contact.avatarImageName];
    }
    else {
        self.avatarImageView.image = [UIImage imageNamed:@"IconAvatarDefault"];
    }
    self.nameLabel.text = contact.name;
    self.signatureLabel.text = contact.signature;
    self.onlineStatusLabel.text = contact.onlineStatus;
}

- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.image = [UIImage imageNamed:@"IconAvatarDefault"];
        // 切割圆形头像
        _avatarImageView.layer.cornerRadius = 35 / 2;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont fontWithName:nil size:14];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.text = @"姓名";
    }
    return _nameLabel;
}

- (UILabel *)signatureLabel
{
    if (!_signatureLabel) {
        _signatureLabel = [[UILabel alloc] init];
        _signatureLabel.font = [UIFont fontWithName:nil size:12];
        _signatureLabel.textColor = [UIColor grayColor];
        _signatureLabel.text = @"个性签名";
    }
    return _signatureLabel;
}

- (UILabel *)onlineStatusLabel
{
    if (!_onlineStatusLabel) {
        _onlineStatusLabel = [[UILabel alloc] init];
        _onlineStatusLabel.font = [UIFont fontWithName:nil size:12];
        _onlineStatusLabel.textColor = [UIColor grayColor];
        _onlineStatusLabel.text = @"在线";
    }
    return _onlineStatusLabel;
}

@end
