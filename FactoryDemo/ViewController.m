//
//  ViewController.m
//  FactoryDemo
//
//  Created by Joeyoung on 2018/3/30.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "ViewController.h"

// 简单工厂
#import "MapFactory.h"
// 工厂方法
#import "AppleComputerFactory.h"
#import "BaiduMapFactory.h"
#import "GaodeMapFactory.h"
// 抽象工厂
#import "AbsAppleComputerFactory.h"
#import "AbsLenovoComputerFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    // 简单工厂
//    [self simpleFactory];
//
//    // 工厂方法
//    [self factoryMethodDemo];
    
//    // 地图工厂方法
//    [self map_factoryMethodDemo];
    
      // 抽象工厂
    [self abstractFactoryDemo];
}

// 简单工厂
- (void)simpleFactory {
    
    // 修改type即可实现地图的切换
    // MapTypeWithBaidu / MapTypeWithGaode
    MapFactory *factory = [[MapFactory alloc] initWithType:MapTypeWithGaode];
    UIView *mapView = [factory getMapViewWithFrame:self.view.bounds];
    [self.view addSubview:mapView];
}

// 地图工厂方法
- (void)map_factoryMethodDemo {
    
    // GaodeMapFactory / BaiduMapFactory 切换就可实现地图的切换
//  id<IMapFactory> factory = [[GaodeMapFactory alloc] init];
    id<IMapFactory> factory = [[BaiduMapFactory alloc] init];
    id<IMapView> mapView = [factory getMapViewWithFrame:self.view.frame];
    [self.view addSubview:[mapView getView]];
    
}

// 工厂方法
- (void)factoryMethodDemo {
    
    id<IComputerFactory> factory = [[AppleComputerFactory alloc] init];
    id<IComputer> computer = [factory getComputer];
    [computer printInfo];
}

// 抽象工厂
- (void)abstractFactoryDemo {
    
    // AbsLenovoComputerFactory / AbsAppleComputerFactory 切换就可实现不同的功能
//  id<IAbsComputerFactory> factory = [[AbsLenovoComputerFactory alloc] init];
    id<IAbsComputerFactory> factory = [[AbsAppleComputerFactory alloc] init];
    id<IAbsComputerCpu> cpu = [factory getCpu];
    [cpu printInfo];
    id<IAbsComputerGraphicsCard> graphicsCard = [factory getGraphicsCard];
    [graphicsCard printInfo];
}



@end
