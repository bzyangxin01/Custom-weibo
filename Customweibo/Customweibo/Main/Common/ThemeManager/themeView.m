//
//  themeView.m
//  Customweibo
//
//  Created by apple on 16/2/4.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "themeView.h"
#import "ThemeManager.h"
@implementation themeView


-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ThemeNSNotification" object:nil];
    
}

- (void)awakeFromNib{
    
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeChange) name:@"ThemeNSNotification" object:nil];
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChange) name:@"ThemeNSNotification" object:nil];
    }
    return self;
}
-(void)setImgName:(NSString *)imgName {
    
    _imgName = imgName;
    //图片名字一改变就切换主题
    [self themeChange];
   }
-(void)themeChange {
    
    //重新设置图片
    UIImage *img = [[ThemeManager shareManager] themeImgWithImgName:_imgName];
    self.image = img;
}


@end
