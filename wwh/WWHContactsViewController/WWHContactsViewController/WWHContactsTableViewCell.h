
#import <UIKit/UIKit.h>
#import "WWHContact.h"

@interface WWHContactsTableViewCell : UITableViewCell

@property (nonatomic, strong) WWHContact *contact;

/**
 *  头像图片
 */
@property (nonatomic, strong) UIImageView *avatarImageView;

/**
 *  姓名标签
 */
@property (nonatomic, strong) UILabel *nameLabel;

/**
 *  个性签名标签
 */
@property (nonatomic, strong) UILabel *signatureLabel;

/**
 *  在线状态标签
 */
@property (nonatomic, strong) UILabel *onlineStatusLabel;

@end
