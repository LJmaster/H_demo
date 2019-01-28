//
//  HEmoteViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/16.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HEmoteViewController.h"
#import "HEmoteView.h"

@interface HEmoteViewController ()

@end

@implementation HEmoteViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hidenNaviBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    HEmoteView * v = [[HEmoteView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:v];
    
    
}



@end
