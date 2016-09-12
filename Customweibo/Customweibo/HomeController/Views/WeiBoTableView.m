//
//  WeiBoTableView.m
//  Customweibo
//
//  Created by apple on 16/2/5.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "WeiBoTableView.h"
#import "WeiBoTableViewCell.h"
#import "WeiboModel.h"
#import "Commom.h"
#import "Weibolayout.h"
@implementation WeiBoTableView


-(void)awakeFromNib {
    
    self.delegate = self;
    self.dataSource = self;
    
}
#pragma mark UITableViewDelegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
    Weibolayout *layout = self.weiboLayout[indexPath.row];

    return layout.cellHeight;
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.weiboLayout.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeiBoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weibocell" forIndexPath:indexPath];
    cell.weibo = self.weiboLayout[indexPath.row];
    
    return cell;
}




@end
