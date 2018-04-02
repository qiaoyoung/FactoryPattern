//
//  AppleComputerFactory.h
//  FactoryDemo
//
//  Created by 乔杨 on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IComputerFactory.h"

// 苹果电脑工厂 -> 遵循电脑工厂协议<IComputerFactory>
@interface AppleComputerFactory : NSObject<IComputerFactory>

@end
