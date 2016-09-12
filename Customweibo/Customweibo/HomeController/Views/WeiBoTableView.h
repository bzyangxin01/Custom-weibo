//
//  WeiBoTableView.h
//  Customweibo
//
//  Created by apple on 16/2/5.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeiBoTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *weiboLayout;

@end
