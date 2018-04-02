//
//  BaiduMapFactory.m
//  FactoryDemo
//
//  Created by 乔杨 on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "BaiduMapFactory.h"
#import "BaiduMapView.h"
// 百度地图
#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@implementation BaiduMapFactory

- (instancetype)init {
    if (self = [super init]) {
        BMKMapManager* _mapManager = [[BMKMapManager alloc] init];
        BOOL ret = [_mapManager start:@"UfT4LGMjKAOB8fWL540hrslg2xVIfiUW"  generalDelegate:nil];
        if (!ret) {
            NSLog(@"manager start failed!");
        }
    }
    return self;
}

// 返回具体的地图View
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame {
    return [[BaiduMapView alloc] initWithFrame:frame];
}

@end
