//
//  HBbbViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/16.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HBBBViewController.h"
#import "HCompViewController.h"
#import "ZYQSphereView.h"
#import "HMatchModel.h"
#import "HMatchViewModel.h"

@interface HBBBViewController ()

@property(nonatomic,strong) HDynmaicBigNavView  * navView;

@property(nonatomic,strong) ZYQSphereView  * sphereView;

@property(nonatomic,strong) UIButton  * selectButton;

@end

@implementation HBBBViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hidenNaviBar];
}


-(HDynmaicBigNavView *)navView{
    if (!_navView) {
        _navView = [[HDynmaicBigNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kstatusBarH + 44 + 62)];
        _navView.backgroundColor = [UIColor whiteColor];
        _navView.bigTitle = @"悬浮的标题";
        _navView.detaileTitle = @"这是个小标题";
//        _navView.changebackgroundImage = [UIImage imageNamed:@"123"];
        _navView.changebackgroundColor = [UIColor blackColor];
        _navView.titleColor = [UIColor redColor];
        _navView.isBackButtonHide = YES;
        UIButton *s = [[UIButton alloc]init];
        s.backgroundColor = [UIColor redColor];
        [s addTarget:self action:@selector(hhh) forControlEvents:(UIControlEventTouchUpInside)];
        _navView.titleRightView = s;
    }
    return _navView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navView];
    [self.view addSubview:self.sphereView];
}

-(void)hhh{
    
    [self presentViewController:[HCompViewController new] animated:YES completion:nil];
}


//=======================
-(ZYQSphereView *)sphereView{
    if (!_sphereView) {
        _sphereView = [[ZYQSphereView alloc] initWithFrame:CGRectMake(00,
                                                                      kstatusBarH + 44 + 62,
                                                                      KScreenWidth,
                                                                      KScreenHeight - kstatusBarH - 44 - 62 - kTabBarHeight - kBottomSafeHeight)];
        //    sphereView.center=CGPointMake(self.view.center.x, self.view.center.y-30);
        NSMutableArray *views = [[NSMutableArray alloc] init];
        for (int i = 0; i < 12; i++) {
            UIButton *subV = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
           
            [subV setImage:[UIImage imageNamed:[NSString stringWithFormat:@"planet_0%dnew",i+1]] forState:UIControlStateNormal];
            if (i >= 10) {
              [subV setImage:[UIImage imageNamed:[NSString stringWithFormat:@"planet_%dnew",i+1]] forState:UIControlStateNormal];
            }
            
            subV.layer.masksToBounds=YES;
            subV.layer.cornerRadius=3;
            [subV addTarget:self action:@selector(subVClick:) forControlEvents:UIControlEventTouchUpInside];
            [views addObject:subV];
        }
        //    传递数据视图
        [_sphereView setItems:views];
        _sphereView.isPanTimerStart=YES;
        //    开始滚动
        [_sphereView timerStart];
    }
    
    return _sphereView;
}

-(void)demo3dvvvv{
  
}

-(void)subVClick:(UIButton*)sender{
    
//    BOOL isStart=[self.sphereView isTimerStart];
//    [self.sphereView timerStop];
//    [UIView animateWithDuration:0.1 animations:^{
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.05 animations:^{
//            sender.transform=CGAffineTransformMakeScale(1, 1);
//            if (isStart) {
//                [self.sphereView timerStart];
//            }
//        }];
//    }];
    
//

    
   CGRect f = [_sphereView convertRect:sender.frame toView:self.view];
    [[HMatchViewModel shared] selectHoroscope:sender withEndView:self.selectButton withFrame:f];
}
-(void)changePF:(UIButton*)sender{
    if ([self.sphereView isTimerStart]) {
        [self.sphereView timerStop];
    }
    else{
        [self.sphereView timerStart];
    }
}
-(UIButton*)selectButton{
    
    if (!_selectButton) {
        _selectButton = [[UIButton alloc] init];
        [_selectButton addTarget:self action:@selector(selectHoroscpeWithmatch:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_selectButton];
    }
    return _selectButton;
}
-(void)selectHoroscpeWithmatch:(UIButton *)sender{
    
}

- (void)xxxxxxxanimatio:(UIView*)bview{
     /* 移动 */
    CABasicAnimation * posAni = [CABasicAnimation animationWithKeyPath:@"position"];
        // 起始帧和终了帧的设定
        posAni.fromValue = [NSValue valueWithCGPoint:bview.layer.position]; // 起始帧
        posAni.toValue = [NSValue valueWithCGPoint:CGPointMake(0, KScreenHeight - 200)]; // 终了帧
    
    CABasicAnimation * bodAni = [CABasicAnimation animationWithKeyPath:@"bounds"];
    bodAni.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 100)];
    
    CAAnimationGroup * groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[posAni, bodAni];
    groupAni.duration = 1.0; // 持续时间
    groupAni.fillMode = kCAFillModeForwards;
    groupAni.removedOnCompletion = NO;
    groupAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [bview.layer addAnimation:groupAni forKey:@"groupAni"];
}

@end
