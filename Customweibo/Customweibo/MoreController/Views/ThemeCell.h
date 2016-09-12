//
//  ThemeCell.h
//  Customweibo
//
//  Created by apple on 16/2/5.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeLabel.h"
@interface ThemeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *themeImg;

@property (weak, nonatomic) IBOutlet ThemeLabel *themeLabel;

@end
