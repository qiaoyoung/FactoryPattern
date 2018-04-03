//
//  GaodeMapView.m
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "GaodeMapView.h"

// 高德地图
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>

@interface GaodeMapView()

@property (nonatomic, strong) MAMapView *mapView;

@end
@implementation GaodeMapView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        _mapView = [[MAMapView alloc] initWithFrame:frame];
    }
    return self;
}

- (UIView *)getView {
    return _mapView;
}

@end
