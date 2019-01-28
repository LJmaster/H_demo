//
//  RootTabBarController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "RootTabBarController.h"
#import "HAAAViewController.h"
#import "HBBBViewController.h"
#import "HCCCViewController.h"
#import "HEmoteViewController.h"
#import "RootNavigationController.h"

@interface RootTabBarController ()
@property (nonatomic,strong) NSMutableArray * VCS;//tabbar root VC
@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView * view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor blackColor];
//    view.frame = self.tabBar.bounds;
//    [[UITabBar appearance] insertSubview:view atIndex:0];
    
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    [UITabBar appearance].translucent = NO;
    
    //添加子控制器
    [self setUpAllChildViewController];
}

#pragma mark - ——————— 初始化VC ————————
-(void)setUpAllChildViewController{
    _VCS = @[].mutableCopy;
    //    HomeViewController *homeVC = [[HomeViewController alloc]init];
    //    WaterFallListViewController *homeVC = [WaterFallListViewController new];
    HAAAViewController *homeVC = [[HAAAViewController alloc]init];
    [self setupChildViewController:homeVC title:@"ZODIAC" imageName:@"zodiac_02" seleceImageName:@"zodiac_01"];
    
    HBBBViewController *makeFriendVC = [[HBBBViewController alloc]init];
    [self setupChildViewController:makeFriendVC title:@"Compatiblity" imageName:@"zodiac_02" seleceImageName:@"zodiac_01"];
    
    HCCCViewController *msgVC = [[HCCCViewController alloc]init];
    [self setupChildViewController:msgVC title:@"Qralce" imageName:@"zodiac_02" seleceImageName:@"zodiac_01"];
    
    HEmoteViewController *mineVC = [[HEmoteViewController alloc]init];
    [self setupChildViewController:mineVC title:@"Emote" imageName:@"zodiac_02" seleceImageName:@"zodiac_01"];
    self.viewControllers = _VCS;
}

-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    //    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    //    controller.tabBarItem.badgeValue = _VCS.count%2==0 ? @"100": @"1";
    //包装导航控制器
    RootNavigationController *nav = [[RootNavigationController alloc]initWithRootViewController:controller];
    controller.title = title;
    [_VCS addObject:nav];
    
}

@end
