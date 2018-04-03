//
//  GaodeMapFactory.m
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "GaodeMapFactory.h"
#import "GaodeMapView.h"
// 高德地图
#import <AMapFoundationKit/AMapFoundationKit.h>

@implementation GaodeMapFactory

- (instancetype)init {
    if (self = [super init]) {
        [AMapServices sharedServices].apiKey = @"cf67bbca16a71b941da1df07550cc526";
    }
    return self;
}

// 返回具体的地图View
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame {
    return [[GaodeMapView alloc] initWithFrame:frame];
}

@end
