//
//  IMapView.h
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

// 地图MapView协议
@protocol IMapView <NSObject>

// 初始化View
- (instancetype)initWithFrame:(CGRect)frame;

// 返回具体的View(高德地图、百度地图)，父类都是UIView
- (UIView *)getView;

// 等等。。 还有其他需要操作地图的方法。。。



@end
