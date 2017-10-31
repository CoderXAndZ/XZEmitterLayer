//
//  ViewController.m
//  XZEmitterLayer
//
//  Created by admin on 2016/10/31.
//  Copyright © 2016年 XZ. All rights reserved.
//

#import "ViewController.h"
#import "XZEmitterLayerView.h" // 粒子动画

@interface ViewController ()

@property (nonatomic, strong) XZEmitterLayerView *viewEmitter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 添加粒子动画
    [self.view addSubview:self.viewEmitter];
}

- (XZEmitterLayerView *)viewEmitter {
    if (!_viewEmitter) {
        _viewEmitter = [[XZEmitterLayerView alloc] initWithFrame:self.view.bounds];
    }
    return _viewEmitter;
}


@end
