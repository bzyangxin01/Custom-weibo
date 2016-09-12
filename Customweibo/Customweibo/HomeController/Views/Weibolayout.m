//
//  Weibolayout.m
//  Customweibo
//
//  Created by apple on 16/2/6.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "Weibolayout.h"
#import "Commom.h"

//空隙
#define kSpace 10
//单元格默认高度
#define kCellHeight 60

@implementation Weibolayout
//计算单元格高度,微博正文高度
-(void)setWeibo:(WeiboModel *)weibo {
    
    //计算frame
    _weibo = weibo;
    self.cellHeight = kCellHeight;
    
    //确定单元格每个子视图的frame
    //(1)计算微博正文所占用的空间(高)
    CGRect textrect = [self.weibo.text boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:16]} context:NULL];
    
    //微博正文的frame
    self.weiboTextFrame = CGRectMake(kSpace, kCellHeight + kSpace, kScreenWidth - 2 * kSpace, textrect.size.height);
    
    //更新单元格的高度
    
    self.cellHeight += CGRectGetHeight(self.weiboTextFrame)+kSpace;
    

}


@end
