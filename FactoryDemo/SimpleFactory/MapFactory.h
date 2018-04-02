//
//  MapFactory.h
//  FactoryDemo
//
//  Created by Joeyoung on 2018/3/30.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MapType) {
    MapTypeWithGaode,         // 高德地图
    MapTypeWithBaidu,         // 百度地图
 };

@interface MapFactory : NSObject


/**
 配置地图

 @param type 地图类型
 */
- (instancetype)initWithType:(MapType)type;


/**
 返回一个地图对象

 @param frame frame
 @return 地图实例
 */
- (UIView *)getMapViewWithFrame:(CGRect)frame;


@end
