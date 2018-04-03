//
//  IAbsComputerGraphicsCard.h
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

// 抽象电脑显卡接口
@protocol IAbsComputerGraphicsCard <NSObject>

// 打印电脑显卡信息
- (void)printInfo;

@end
