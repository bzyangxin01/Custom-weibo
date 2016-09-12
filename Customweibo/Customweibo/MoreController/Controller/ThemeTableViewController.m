//
//  ThemeTableViewController.m
//  Customweibo
//
//  Created by apple on 16/2/4.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "ThemeTableViewController.h"
#import "ThemeManager.h"
#import "MoreController.h"
#import "ThemeCell.h"
@interface ThemeTableViewController ()

@property (nonatomic,strong) NSDictionary *themeDic;

@end

@implementation ThemeTableViewController



-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        //监听主题切换的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChange) name:@"ThemeNSNotification" object:nil];
    }
    return self;
}

-(void)themeChange {
    
    //表视图的背景颜色和分割线颜色
    UIColor *tabelViewColor = [[ThemeManager shareManager] themeColorWithColorName:@"More_Item_color"];
    self.tableView.backgroundColor = tabelViewColor;
    
    //线的颜色
    UIColor *lineColor = [[ThemeManager shareManager] themeColorWithColorName:@"More_Item_Line_color"];
    self.tableView.separatorColor = lineColor;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _themeDic = [ThemeManager shareManager].themeDic;
    //设置默认颜色
    [self themeChange];

}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _themeDic.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ThemeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"themeCell" forIndexPath:indexPath];
    
    NSArray *arr = [_themeDic allKeys];
    //单元格上显示的内容
    NSString *themeName = arr[indexPath.row];
    cell.textLabel.text = themeName;

    
    //改变单元格字体颜色
    cell.textLabel.textColor = [[ThemeManager shareManager] themeColorWithColorName:@"Compose_Option_color"];
    
    
    //显示的图片(获取路径)(1.jap - >找到路径->读取图片返回给我们)
    //(获取路径)
    //根据主题名字,获取主题路径
    NSString *themePath = [ThemeManager shareManager].themeDic[themeName];
    NSString *imgPath = [[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:themePath] stringByAppendingPathComponent:@"more_icon_theme.png"];
    cell.themeImg.image = [UIImage imageWithContentsOfFile:imgPath];
    
    //获取当前主题
    if ([[ThemeManager shareManager].themeName isEqualToString:themeName]) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    return cell;
}

//选中单元格调用方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *allKeys= [_themeDic allKeys];
    
    //切换主题
    [ThemeManager shareManager].themeName = allKeys[indexPath.row];
    
    [tableView reloadData];
}

@end
