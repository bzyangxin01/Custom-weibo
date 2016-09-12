//
//  BaseViewController.m
//  Customweibo
//
//  Created by apple on 16/2/2.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "BaseViewController.h"
#import "ThemeManager.h"
@implementation BaseViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self themeChange];
}

-(void)themeChange {
    
    //找到导航栏对应的图片
    UIImage *img = [[ThemeManager shareManager] themeImgWithImgName:@"mask_titlebar64.png"];
    
    [self.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
}

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ThemeNSNotification" object:nil];
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChange) name:@"ThemeNSNotification" object:nil];
    }
    return self;
}


@end
