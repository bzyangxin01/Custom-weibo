//
//  HomeController.m
//  Customweibo
//
//  Created by apple on 16/2/2.
//  Copyright © 2016年 niaho. All rights reserved.
//

#import "HomeController.h"
#import "SinaWeibo.h"
#import "AppDelegate.h"
#import "ThemeManager.h"
#import "UserModel.h"
#import "WeiboModel.h"
#import "YYModel.h"
#import "WeiBoTableView.h"
#import "Weibolayout.h"


@interface HomeController()<SinaWeiboDelegate,SinaWeiboRequestDelegate>
@property (nonatomic,strong) NSMutableArray *weiboList;

@end
@implementation HomeController
-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Home";
    
    
    SinaWeibo *sinaWeibo= [self sinaweibo];
    
    [sinaWeibo setDelegate:self];

    [sinaWeibo logIn];
    


}

//懒加载创建数组
-(NSMutableArray *)weiboList {
    
    if (_weiboList == nil) {
        _weiboList = [NSMutableArray array];
    }
    return _weiboList;
}

- (SinaWeibo *)sinaweibo
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}

//存储登录信息
- (void)storeAuthData
{
    SinaWeibo *sinaweibo = [self sinaweibo];
    
    NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
                              sinaweibo.accessToken, @"AccessTokenKey",
                              sinaweibo.expirationDate, @"ExpirationDateKey",
                              sinaweibo.userID, @"UserIDKey",
                              sinaweibo.refreshToken, @"refresh_token", nil];
    [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"SinaWeiboAuthData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//登陆调用的代理方法
- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo{
    
    //存储token
    [self storeAuthData];
    
    
    //请求网络数据(url 请求参数 请求方式 request resume)
    
    //新浪SDK提供的网络请求
    [[self sinaweibo] requestWithURL:@"statuses/home_timeline.json" params:nil httpMethod:@"GET" delegate:self];
    
    
    
}
//请求数据成功调用的方法
-(void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result {
    
   // NSLog(@"%@",result);
    
    //给model赋值
    //(1)获取微博列表的数据
    NSArray *statuesArr = result[@"statuses"];
    for (NSDictionary *statuesDic in statuesArr) {
        
        /*
         WeiboModel *weiboMode = [[WeiboModel alloc]init];
         
         weiboMode.created_at = status[@"created_at"];
         weiboMode.idstr = status[@"idstr"];
         
         //用户model赋值
         UserModel *user = [[UserModel alloc]init];
         user.name = status[@"user"][@"name"];
         user.idstr = status[@"user"][@"idstr"];
         
         weiboMode.user = user;
         
         //转发微博赋值
         WeiboModel *reModel = [[WeiboModel alloc]init];
         
         reModel.created_at = status[@"retweeted_status"][@"created_at"];
         
         weiboMode.retweeted_status = reModel;
         */
        //使用YYModel给model赋值
        WeiboModel *weibo = [WeiboModel yy_modelWithDictionary:statuesDic];
        [self.weiboList addObject:weibo];
        
    }
    self.weiboTableView.weiboLayout = _weiboList;
    //重点,数据来了重新刷新单元格
    [self.weiboTableView reloadData];
    
}



@end
