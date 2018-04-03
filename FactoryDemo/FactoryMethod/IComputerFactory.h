//
//  IComputerFactory.h
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IComputer.h"

@protocol IComputerFactory <NSObject>

// 电脑工厂负责生产遵循<IComputer>协议的电脑 -> id<IComputer>
- (id<IComputer>)getComputer;

@end
