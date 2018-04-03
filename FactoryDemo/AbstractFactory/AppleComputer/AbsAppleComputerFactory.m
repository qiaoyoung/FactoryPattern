//
//  AbsAppleComputerFactory.m
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "AbsAppleComputerFactory.h"
#import "AbsAppleComputerGraphicsCard.h"
#import "AbsAppleComputerCpu.h"

@implementation AbsAppleComputerFactory

// CPU
- (id<IAbsComputerCpu>)getCpu {
    return [[AbsAppleComputerCpu alloc] init];
}
// 显卡
- (id<IAbsComputerGraphicsCard>)getGraphicsCard {
    return [[AbsAppleComputerGraphicsCard alloc] init];
}

@end
