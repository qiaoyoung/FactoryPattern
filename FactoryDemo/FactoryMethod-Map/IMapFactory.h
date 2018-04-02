//
//  IMapFactory.h
//  FactoryDemo
//
//  Created by 乔杨 on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMapView.h"

// 地图工厂协议
@protocol IMapFactory <NSObject>

- (id<IMapView>)getMapViewWithFrame:(CGRect)frame;

@end
