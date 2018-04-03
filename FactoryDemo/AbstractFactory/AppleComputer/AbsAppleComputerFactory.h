//
//  AbsAppleComputerFactory.h
//  FactoryDemo
//
//  Created by Joeyoung on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAbsComputerFactory.h"

// 遵循协议 <IAbsComputerFactory> 的实现类
@interface AbsAppleComputerFactory : NSObject<IAbsComputerFactory>

@end
