//
//  WeiBoTableViewCell.h
//  Customweibo
//
//  Created by apple on 16/2/5.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiboModel;
@class Weibolayout;
@interface WeiBoTableViewCell : UITableViewCell

@property (nonatomic,strong) WeiboModel *weibo;

@property (nonatomic,strong) Weibolayout *layout;
@property (nonatomic,strong) UILabel *weiboText;

@property (weak, nonatomic) IBOutlet UIImageView *userImgView;

@property (weak, nonatomic) IBOutlet UILabel *userText;

@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UILabel *resurce;

@end
