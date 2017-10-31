//
//  XZEmitterLayerView.m
//  XZLiveApp
//
//  Created by admin on 2016/10/31.
//  Copyright © 2016年 RongTuoJinRong. All rights reserved.
//  粒子动画

#import "XZEmitterLayerView.h"
#define XZRGBColor(r,g,b) [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:1.0]

@interface XZEmitterLayerView()

@property (nonatomic, strong) CAEmitterLayer *emitterLayer;

@end

@implementation XZEmitterLayerView

+ (Class)layerClass {
    return [CAEmitterLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initEmitterLayer];
    }
    return self;
}

- (void)initEmitterLayer {
    if (_emitterLayer) {
        [_emitterLayer removeFromSuperlayer];
        _emitterLayer = nil;
    }
    
    _emitterLayer = [[CAEmitterLayer alloc] init];
    _emitterLayer.backgroundColor = [UIColor blueColor].CGColor;
    // 发射器在xy平面的中心位置
    //        CGSize size = self.moviePlayer.view.frame.size;
    CGSize size = self.frame.size;
    // 发射点的位置
    _emitterLayer.emitterPosition = CGPointMake(size.width - 100, size.height - 100);
    // 发射器的尺寸大小
    _emitterLayer.emitterSize = CGSizeMake(20, 20);
    // 渲染/发射模式
    _emitterLayer.renderMode = kCAEmitterLayerUnordered;
    // 发射形状
    _emitterLayer.emitterMode = kCAEmitterLayerSurface;
//    // 开启三维效果
//    _emitterLayer.preservesDepth = YES;
    NSMutableArray *array = [NSMutableArray array];
    // 创建粒子
    for (int i = 0; i < 10; i++) {
        // 发射单元
        CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
        // 粒子的创建速率，默认为1/s
        emitterCell.birthRate = 1;
        // 粒子存活时间
        emitterCell.lifetime = arc4random_uniform(4) + 1;
        // 粒子的生存时间容差
        emitterCell.lifetimeRange = 1.5;
        // 颜色
        emitterCell.color = XZRGBColor(0.8, 0.4, 0.2).CGColor;
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"good%d_30x30",i]];
        // 粒子显示的内容
        emitterCell.contents = (id)[image CGImage];
        // 粒子的名字
//        [emitterCell setName:[NSString stringWithFormat:@"good%d_30x30",i]];
        // 粒子的运动速度
        emitterCell.velocity = arc4random_uniform(100) + 100;
        // 粒子速度的容差
        emitterCell.velocityRange = 80;
        // 粒子在xy平面的发射角度
        emitterCell.emissionLongitude = M_PI+M_PI_2;
        // 粒子发射角度的容差
        emitterCell.emissionRange = M_PI_2/6;
        // 缩放比例
        emitterCell.scale = 0.3;
        [array addObject:emitterCell];
    }
    _emitterLayer.emitterCells = array;
    [self.layer addSublayer:_emitterLayer];
}

@end
