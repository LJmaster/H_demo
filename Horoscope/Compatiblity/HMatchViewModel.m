//
//  HMatchViewModel.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/23.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HMatchViewModel.h"

@implementation HMatchViewModel

+(HMatchViewModel *)shared{
    static HMatchViewModel * viewmodel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        viewmodel = [[self alloc] init];
    });
    return viewmodel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.model = [[HMatchModel alloc] init];
    }
    return self;
}

/**
 点击

 @param horoscopeButton 选择的星座button
 @param selectView 最后展示的位置
 @param f 星座button 相对self。view的frame
 */
-(void)selectHoroscope:(UIButton *)horoscopeButton  withEndView:(UIButton *)selectView  withFrame:(CGRect)f{

    //    获取旋转的星座button  相对self.view的 frame
//    CGRect f = [baseView convertRect:sender.frame toView:self.view];
    
    if (self.model.leftisSartSelect == NO || self.model.rightisSartSelect == YES) {
        selectView.frame = f;
        selectView.tag = horoscopeButton.tag;
        [selectView setImage:horoscopeButton.currentImage forState:(UIControlStateNormal)];
        [UIView animateWithDuration:0.3 animations:^{
            selectView.y = KScreenHeight - 200;
            selectView.x = 0;
        } completion:^(BOOL finished) {
            selectView.width = 100;
            selectView.height = 100;
        }];
        self.model.leftisSartSelect = YES;
        self.model.leftisEndSelect  = YES;
        self.model.lefthoroscopeTag  = (int)horoscopeButton.tag;
    }else{
        selectView.frame = f;
        selectView.tag = horoscopeButton.tag;
        [selectView setImage:horoscopeButton.currentImage forState:(UIControlStateNormal)];
        [UIView animateWithDuration:0.3 animations:^{
            selectView.y = KScreenHeight - 200;
            selectView.x = KScreenWidth - 100;
        } completion:^(BOOL finished) {
            selectView.width = 100;
            selectView.height = 100;
        }];
        self.model.rightisSartSelect = YES;
        self.model.rightisEndSelect  = YES;
        self.model.righthoroscopeTag  = (int)horoscopeButton.tag;
        
    }
    
    
    
    
}

@end
