//
//  Weibolayout.h
//  Customweibo
//
//  Created by apple on 16/2/6.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WeiboModel.h"
@interface Weibolayout : NSObject

//单元格的高度
@property (nonatomic,assign) CGFloat cellHeight;

//微博正文
@property (nonatomic,assign) CGRect weiboTextFrame;
//数据
@property (nonatomic,strong) WeiboModel *weibo;

@end
