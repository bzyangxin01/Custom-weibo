//
//  MainTabBarController.m
//  Customweibo
//
//  Created by apple on 16/2/2.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "MainTabBarController.h"
#import "Commom.h"
#import "ThemeManager.h"
#import "ThemeButton.h"
#import "BaseViewController.h"

@interface MainTabBarController()

@end
@implementation MainTabBarController


-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    //构造三级控制器
    [self _loadSubViewController];
    
    //移除所有的子视图
    [self _removeSubviews];
    
}

-(void)_removeSubviews {
    
    themeView *imgView = [[themeView alloc]initWithFrame:self.tabBar.bounds];
    
    imgView.imgName = @"mask_navbar.png";
    
    [self.tabBar addSubview:imgView];
    

    //移除子视图
    for (UIView *view in self.tabBar.subviews) {
        
        Class c = NSClassFromString(@"UITabBarButton");
        
        //如果是c类型创建的就删除
        if ([view isKindOfClass:c]) {
            
            [view removeFromSuperview];
        }
    }
    
    //自定义创建按钮
    for (int i = 0; i < 5; i++) {
        
        ThemeButton *button = [ThemeButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*kScreenWidth/5, 0, kScreenWidth/5, kTabbarHeight);
        NSString *imgName = [NSString stringWithFormat:@"home_tab_icon_%d@2x.png",i+1];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        
        button.imgName = imgName;
        [self.tabBar addSubview:button];
    }
    
//    //设置tabbar的背景颜色
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"mask_navbar"]];
//    
    _selectImg = [[themeView alloc] init];
    //设置图片
    _selectImg.imgName = @"home_bottom_tab_arrow.png";
    _selectImg.frame = CGRectMake(0, 0, kScreenWidth/5, kTabbarHeight);
    [self.tabBar addSubview:_selectImg];
    
    
    
}

-(void)_loadSubViewController {
    
    //所有故事版的名字
    NSArray *nameArr = @[@"Home",@"Message",@"Profile",@"Discover",@"More"];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSString *sbName in nameArr) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:sbName bundle:nil];
        //加载导航控制器
        BaseViewController *navCtr = [storyboard instantiateInitialViewController];
        [arr addObject:navCtr];
    }
    //将导航控制器交给标签控制器管理
    self.viewControllers = arr;
}


-(void)buttonAction:(UIButton *)button {
    
    [UIView animateWithDuration:0.35 animations:^{
        
        _selectImg.center = button.center;
    }];
    //切换子控制器
    self.selectedIndex = button.tag;
}

@end
