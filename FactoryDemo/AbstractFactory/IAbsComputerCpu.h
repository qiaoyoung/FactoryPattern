//
//  IAbsComputerCpu.h
//  FactoryDemo
//
//  Created by 乔杨 on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

// 抽象电脑Cpu接口
@protocol IAbsComputerCpu <NSObject>

// 打印电脑Cpu信息
- (void)printInfo;

@end
