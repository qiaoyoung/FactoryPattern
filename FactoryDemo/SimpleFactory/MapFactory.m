//
//  MapFactory.m
//  FactoryDemo
//
//  Created by Joeyoung on 2018/3/30.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "MapFactory.h"

// 高德地图
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>
// 百度地图
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface MapFactory()

/** 地图类型 */
@property(nonatomic,assign) MapType mapType;
/** 地图 */
@property(nonatomic,strong) UIView *mapView;

@end

@implementation MapFactory

- (instancetype)initWithType:(MapType)type {
    self = [super init];
    if (self) {
        _mapType = type;
        
        if (_mapType == MapTypeWithGaode) {
            [AMapServices sharedServices].apiKey = @"cf67bbca16a71b941da1df07550cc526";
        } else if (_mapType == MapTypeWithBaidu) {
            BMKMapManager* _mapManager = [[BMKMapManager alloc] init];
            BOOL ret = [_mapManager start:@"UfT4LGMjKAOB8fWL540hrslg2xVIfiUW"  generalDelegate:nil];
            if (!ret) {
                NSLog(@"manager start failed!");
            }
        }
    }
    
    return self;
}

- (UIView *)getMapViewWithFrame:(CGRect)frame {
    
    if (_mapType == MapTypeWithGaode) {
        _mapView = [[MAMapView alloc] initWithFrame:frame];
    } else if (_mapType == MapTypeWithBaidu) {
        _mapView = [[BMKMapView alloc]initWithFrame:frame];
    }

    return _mapView;
}

@end
