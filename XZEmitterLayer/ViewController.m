//
//  ViewController.m
//  XZEmitterLayer
//
//  Created by admin on 2016/10/31.
//  Copyright © 2016年 XZ. All rights reserved.
//

#import "ViewController.h"
#import "XZEmitterLayerView.h" // 粒子动画
//#import "BarrageRenderer.h"

@interface ViewController ()
//<BarrageRendererDelegate>

@property (nonatomic, strong) XZEmitterLayerView *viewEmitter;

//@property (nonatomic, strong) BarrageRenderer *renderer;
//@property (nonatomic, assign) NSTimeInterval predictedTime;
//@property (nonatomic, strong) NSDate *startDate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // 创建按钮
//    [self setUpButtonUI];
//    // 初始化弹幕
//    [self initBarrageRenderer];
}

//- (void)didClickOpenBarrageButton:(UIButton *)btnBarrage {
//    btnBarrage.selected = !btnBarrage.selected;
//    if (btnBarrage.selected) { // 打开弹幕
//        [btnBarrage setTitle:@"Closed" forState:UIControlStateNormal];
//        [self sendBarrageWithMessage:@"我是弹幕"];
//        [_renderer start];
//    }else { // 关闭弹幕
//        [btnBarrage setTitle:@"Open" forState:UIControlStateNormal];
//        [_renderer stop];
//    }
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 添加粒子动画
    [self.view addSubview:self.viewEmitter];
    
}

//- (void)initBarrageRenderer {
//    self.renderer = [[BarrageRenderer alloc] init];
//    self.renderer.view.userInteractionEnabled = NO;
//    self.renderer.masked = NO;
//    self.renderer.delegate = self;
//    self.renderer.redisplay = YES;
//    self.renderer.canvasMargin = UIEdgeInsetsMake(30, 0, 30, 0);
//    self.predictedTime = 0.0f;
//    [self start];
//    [self.view addSubview:self.renderer.view];
//}
//
//- (void)setUpButtonUI {
//    UIButton *btnOpenBarrage = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.viewEmitter addSubview:btnOpenBarrage];
//    btnOpenBarrage.frame = CGRectMake(100, 100, 100, 50);
//    [btnOpenBarrage setTitle:@"Open" forState:UIControlStateNormal];
//    [btnOpenBarrage addTarget:self action:@selector(didClickOpenBarrageButton:) forControlEvents:UIControlEventTouchUpInside];
//}
//
//- (void)start {
//    self.startDate = [NSDate date];
//    [self.renderer start];
//}
//
////发送弹幕
//- (void)sendBarrageWithMessage:(NSString *)message
//{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.renderer receive:[self walkImageTextSpriteDescriptorAWithData:message]];
//    });
//}
//
////加载弹幕描述符
//- (BarrageDescriptor *)walkImageTextSpriteDescriptorAWithData:(NSString *)message
//{
//    BarrageDescriptor * descriptor = [[BarrageDescriptor alloc] init];
//    descriptor.spriteName = NSStringFromClass([BarrageWalkTextSprite class]);
//    descriptor.params[@"direction"] = @(BarrageWalkDirectionR2L);
//    descriptor.params[@"trackNumber"] = @5;
//    descriptor.params[@"text"] = message? : @"我是弹幕";
//    descriptor.params[@"textColor"] = [UIColor yellowColor];
//    descriptor.params[@"shadowColor"] = [UIColor darkGrayColor];
//    descriptor.params[@"speed"] = @(0.5 * message.length + 100);
//    return descriptor;
//}
//
//#pragma mark - BarrageRendererDelegate
//
//- (NSTimeInterval)timeForBarrageRenderer:(BarrageRenderer *)renderer
//{
//    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:self.startDate];
//    interval += self.predictedTime;
//    return interval;
//}

- (XZEmitterLayerView *)viewEmitter {
    if (!_viewEmitter) {
        _viewEmitter = [[XZEmitterLayerView alloc] initWithFrame:self.view.bounds];
    }
    return _viewEmitter;
}


@end
