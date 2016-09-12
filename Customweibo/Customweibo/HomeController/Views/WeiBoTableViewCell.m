//
//  WeiBoTableViewCell.m
//  Customweibo
//
//  Created by apple on 16/2/5.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "WeiBoTableViewCell.h"
#import "WeiboModel.h"
#import "UserModel.h"
#import "UIImageView+WebCache.h"
#import "Commom.h"
#import "Weibolayout.h"
@implementation WeiBoTableViewCell

- (UILabel *)weiboText{
    
    
    
    if (_weiboText == nil) {
        _weiboText = [[UILabel alloc]initWithFrame:CGRectZero];
        _weiboText.font = [UIFont systemFontOfSize:16];
        _weiboText.numberOfLines = 0;
        [self.contentView addSubview:_weiboText];
    }
    return _weiboText;
}

- (void)awakeFromNib {
    
    //设置图片圆角属性
    self.userImgView.layer.cornerRadius = 5;
    self.userImgView.layer.borderColor = [UIColor grayColor].CGColor;
    self.userImgView.layer.borderWidth = .5;
    
    self.userImgView.layer.masksToBounds = YES;
    
}

-(void)setLayout:(Weibolayout *)layout {
    
    _layout = layout;
    //昵称
    _userText.text = _layout.weibo.user.name;
    
    //    //时间
    //    _time.text = _weibo.created_at;
    //
    //    //来源
    //    _source.text = _weibo.source;
    
    //头像
    
    [_userImgView sd_setImageWithURL:[NSURL URLWithString:_layout.weibo.user.profile_image_url]];
    
    //微博正文
    self.weiboText.text = _layout.weibo.text;
    
    self.weiboText.frame = _layout.weiboTextFrame;
    

    
}




@end
