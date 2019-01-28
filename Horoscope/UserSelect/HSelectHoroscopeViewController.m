//
//  HSelectHoroscopeViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HSelectHoroscopeViewController.h"
#import "HSTopCompassView.h"
#import "HSHeavenlyBodyView.h"
#import "AISnowView.h"
#import "HSStopStarView.h"
#import "AppDelegate+Service.h"
#import "RootTabBarController.h"

@interface HSelectHoroscopeViewController ()<HeavenlyBodyDelegate,CompassDelegate>

///星球循环
@property (nonatomic, strong) HSHeavenlyBodyView *heavenlyBodyView;
///星座循环
@property (nonatomic, strong) HSTopCompassView *compassView;
/** 飞行流星动画*/
@property(nonatomic,strong)AISnowView *meteorView;
/** 停止流星动画*/
@property(nonatomic,strong)HSStopStarView *stopStarView;

@end

@implementation HSelectHoroscopeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self meterorAnimation];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.heavenlyBodyView];
    [self.view addSubview:self.compassView];
    
    UIButton * click =  [[BaseView baseShare] creatButtonFrame:CGRectMake(50, KScreenHeight - 120, KScreenWidth - 100, 40)
                           withimageOrtext:@"点击"
                           withrootView:self.view
                           withtarget:self
                           withaction:@selector(rootVc)];
//    click.backgroundColor = [UIColor whiteColor];
    
}


-(void)rootVc{
   kAppWindow.rootViewController = [RootTabBarController new];
}
//TODO:接收代理方法传过来的值   更新星球跟icon 已经名称缩略图
- (void)changeHeavenlyItem:(NSInteger )heavenlyItem{
}
-(void)changeHeavenlyIndexpath:(NSIndexPath *)indexPath{
    [self.compassView compassUpdateCurrentlySelectedWithIndexpath:indexPath];
}
- (void)changeCompassItem:(NSInteger )compassItem{
}
-(void)changeCompassIndexpath:(NSIndexPath *)indexpath{
    [self.heavenlyBodyView heavenlyUpdateCurrentlySelectedWithIndexpath:indexpath];
}
-(HSTopCompassView *)compassView{
    //星座轮播
    if (!_compassView) {
        _compassView = [[HSTopCompassView alloc] initWithFrame:CGRectMake(0, KScreenHeight - 65, KScreenWidth, 65)];
        _compassView.delegate = self;
    }
    return _compassView;
}
-(HSHeavenlyBodyView *)heavenlyBodyView{
    //星球轮播
    if (!_heavenlyBodyView) {
        _heavenlyBodyView = [[HSHeavenlyBodyView alloc] initWithFrame:CGRectMake(0, 80, KScreenWidth, KScreenWidth)];
        [self.view addSubview:_heavenlyBodyView];
        _heavenlyBodyView.delegate = self;
    }
    return _heavenlyBodyView;
}
#pragma mark -//流星背景动画
- (void)meterorAnimation{
    self.meteorView       = [[AISnowView alloc]initWithFrame: CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.meteorView];
    
    self.stopStarView       = [[HSStopStarView alloc]initWithFrame: CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.stopStarView];
    
}
@end
