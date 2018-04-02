//
//  AppleComputer.h
//  FactoryDemo
//
//  Created by 乔杨 on 2018/4/2.
//  Copyright © 2018年 Joeyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IComputer.h"

// 苹果电脑 -> 遵循电脑协议<IComputer>
@interface AppleComputer : NSObject<IComputer>

@end
