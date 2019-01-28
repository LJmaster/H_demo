
//
//  HEmoteView.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/16.
//  Copyright © 2019 makerLJ. All rights reserved.
//
//面部b拼凑的顺序
//        头发后
//        脸，
//        鼻子，
//        嘴巴，
//        眉毛，
//        眼白，
//        特征（有些是要被头发遮挡 ，还有一部分是要被眼睛遮挡的，这一步需要），
//        眼珠，
//        头发前（头发是分前后层的需要处理，这个可能需要两层，后一层头发需要将试图放到最后），
//        胡子

#import "HEmoteView.h"

@interface HEmoteView ()

@property (nonatomic, strong) UIView * faceallView;
@property (nonatomic, strong) NSArray * titleName;
@property (nonatomic, strong)NSMutableArray * faceViewArray;
//@property (nonatomic, strong)
//@property (nonatomic, strong)

@end

@implementation HEmoteView

-(NSArray *)titleName{
    if (_titleName == nil) {
        _titleName = [[NSArray alloc] initWithObjects:@"Face Shape",@"Hairstyle",@"Eye shape",@"Eyebrow",@"Nose",@"Mouth",@"Facial Hair",@"Feature", nil];
    }
    return _titleName;
}
-(NSMutableArray *)faceViewArray{
    if (_faceViewArray == nil) {
        _faceViewArray = [[NSMutableArray alloc] init];
    }
    return _faceViewArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KWhiteColor;
        
        self.faceallView = [[UIView alloc] initWithFrame:CGRectMake(0, 184, 250, 250)];
        self.faceallView.centerX = self.centerX;
        [self addSubview:self.faceallView];
        //        脸
        for (int i = 0; i< self.titleName.count; i++) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.faceallView.bounds];
            [self.faceViewArray addObject:imageView];
            [self.faceallView addSubview:imageView];
            imageView.tag = 100 + i;
            imageView.backgroundColor = randomColor;
        }
    }
    return self;
}

@end
