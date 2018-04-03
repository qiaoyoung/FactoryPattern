//
//  BaiduMapView.m
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "BaiduMapView.h"

// 百度地图
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface BaiduMapView()

@property (nonatomic, strong) BMKMapView *mapView;

@end

@implementation BaiduMapView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        _mapView = [[BMKMapView alloc] initWithFrame:frame];
    }
    return self;
}

- (UIView *)getView {
    return _mapView;
}

@end
