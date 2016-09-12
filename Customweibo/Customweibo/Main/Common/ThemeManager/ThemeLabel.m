//
//  ThemeLabel.m
//  Customweibo
//
//  Created by apple on 16/2/4.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "ThemeLabel.h"
#import "ThemeManager.h"
@implementation ThemeLabel



-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ThemeNSNotification" object:nil];
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChange) name:@"ThemeNSNotification" object:nil];
    }
    return self;
}

-(void)themeChange {
    
    //根据颜色的key,获取不同的主题颜色
    self.textColor = [[ThemeManager shareManager] themeColorWithColorName:_colorName];
    
}
-(void)setColorName:(NSString *)colorName {
    
    _colorName = colorName;
 
    [self themeChange];
}


@end
