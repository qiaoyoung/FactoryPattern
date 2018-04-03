//
//  AbsLenovoComputerFactory.m
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "AbsLenovoComputerFactory.h"
#import "AbsLenovoComputerCpu.h"
#import "AbsLenovoComputerGraphicsCard.h"

@implementation AbsLenovoComputerFactory

// CPU
- (id<IAbsComputerCpu>)getCpu {
    return [[AbsLenovoComputerCpu alloc] init];
}
// 显卡
- (id<IAbsComputerGraphicsCard>)getGraphicsCard {
    return [[AbsLenovoComputerGraphicsCard alloc] init];
}

@end
