//
//  MoreController.m
//  Customweibo
//
//  Created by apple on 16/2/2.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "MoreController.h"
#import "ThemeManager.h"
#import "ThemeLabel.h"
#import "themeView.h"

@interface MoreController ()

@property (weak, nonatomic) IBOutlet themeView *themeImgView;
@property (weak, nonatomic) IBOutlet ThemeLabel *row1ThemeChange;
@property (weak, nonatomic) IBOutlet ThemeLabel *row1ThemeName;
@property (weak, nonatomic) IBOutlet themeView *row2UserImg;
@property (weak, nonatomic) IBOutlet themeView *row4AdviceImg;


@end
@implementation MoreController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"More";
    
    _themeImgView.imgName = @"more_icon_theme";
    _row1ThemeChange.colorName = @"More_Item_Text_color";
    _row1ThemeName.colorName = @"More_Item_Text_color";
    

    
    //设置默认的颜色
    [self themeChange];
}

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
    
    //显示当前主题的名字
    _row1ThemeName.text = [ThemeManager shareManager].themeName;
}



@end
