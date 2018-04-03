//
//  IAbsComputerFactory.h
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAbsComputerCpu.h"
#import "IAbsComputerGraphicsCard.h"

// 抽象工厂 电脑统一的抽象接口
@protocol IAbsComputerFactory <NSObject>

// CPU
- (id<IAbsComputerCpu>)getCpu;
// 显卡
- (id<IAbsComputerGraphicsCard>)getGraphicsCard;

@end
