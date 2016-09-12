//
//  ThemeManager.h
//  Customweibo
//
//  Created by apple on 16/2/4.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ThemeManager : NSObject

@property (nonatomic,strong) NSDictionary *themeDic;
@property (nonatomic,strong) NSDictionary *colorDic;
@property (nonatomic,copy) NSString *themeName;// 当前主题

+(instancetype)shareManager;

-(UIImage *)themeImgWithImgName:(NSString *)ImgName;
-(UIColor *)themeColorWithColorName:(NSString *)colorName;
@end
