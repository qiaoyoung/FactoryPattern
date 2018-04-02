//
//  AppleComputerFactory.m
//  FactoryDemo
//
//  Created by 乔杨 on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import "AppleComputerFactory.h"
#import "AppleComputer.h"

@implementation AppleComputerFactory

// 返回具体的电脑
- (id<IComputer>)getComputer {
    return [[AppleComputer alloc] init];
}

@end
