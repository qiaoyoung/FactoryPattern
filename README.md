# FactoryPattern
这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。
在工厂模式中，我们在创建对象时不会对客户端暴露创建逻辑，并且是通过使用一个共同的接口（协议）来指向新创建的对象。

### （一）简单工厂：
####  建模：![](https://upload-images.jianshu.io/upload_images/3265534-45b5aa095d2d1a69.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### Step 1:
配置项目中用到的[高德地图](http://lbs.amap.com/api/ios-sdk/gettingstarted)和[百度地图](http://lbsyun.baidu.com/index.php?title=iossdk/guide/create-project/ak)，请参照官方文档自行配置，这里不再阐述。
#### Step 2:
创建简单工厂类 `MapFactory` ,定义地图类型枚举。
```
typedef NS_ENUM(NSInteger, MapType) {
MapTypeWithGaode,         // 高德地图
MapTypeWithBaidu,         // 百度地图
};
```
在 `MapFactory.h` 中定义两个方法：
```
/**
配置地图

@param type 地图类型
*/
- (instancetype)initWithType:(MapType)type;

/**
返回一个地图对象

@param frame frame
@return 地图实例
*/
- (UIView *)getMapViewWithFrame:(CGRect)frame;
```
#### Step 3: 导入地图头文件，实现 `MapFactory .m`
```
// 高德地图
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>
// 百度地图
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface MapFactory()

/** 地图类型 */
@property(nonatomic,assign) MapType mapType;
/** 地图 */
@property(nonatomic,strong) UIView *mapView;

@end

@implementation MapFactory

- (instancetype)initWithType:(MapType)type {
self = [super init];
if (self) {
_mapType = type;

if (_mapType == MapTypeWithGaode) {
[AMapServices sharedServices].apiKey = @"cf67bbca16a71b941da1df07550cc526";
} else if (_mapType == MapTypeWithBaidu) {
BMKMapManager* _mapManager = [[BMKMapManager alloc] init];
BOOL ret = [_mapManager start:@"UfT4LGMjKAOB8fWL540hrslg2xVIfiUW"  generalDelegate:nil];
if (!ret) {
NSLog(@"manager start failed!");
}
}
}

return self;
}

- (UIView *)getMapViewWithFrame:(CGRect)frame {

if (_mapType == MapTypeWithGaode) {
_mapView = [[MAMapView alloc] initWithFrame:frame];
} else if (_mapType == MapTypeWithBaidu) {
_mapView = [[BMKMapView alloc]initWithFrame:frame];
}

return _mapView;
}
``` 
#### Step 4: 简单工厂的使用
在需要使用地图的 `controller` 中，`#import "MapFactory.h"`

```
// 修改type即可实现地图的切换
MapFactory *factory = [[MapFactory alloc] initWithType:MapTypeWithGaode];
UIView *mapView = [factory getMapViewWithFrame:self.view.bounds];
[self.view addSubview:mapView];
```
效果如下：      
![高德地图](https://upload-images.jianshu.io/upload_images/3265534-8df8459adaeaf2d0.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)         
![百度地图](https://upload-images.jianshu.io/upload_images/3265534-fa3715611d14f703.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### （二）工厂方法：
**在简单工厂的基础之上进行了抽象（protocol）.**
**定义一个用于创建对象的统一接口（protocol）,然后由子类实现。**
####  建模：
![](https://upload-images.jianshu.io/upload_images/3265534-31c2c881cb7a303c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### Step 1:
根据模型创建工厂方法协议 `IComputerFactory` 和 `IComputer` protocol。            
![](https://upload-images.jianshu.io/upload_images/3265534-42907f5aac0c52d6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
// IComputerFactory
#import <Foundation/Foundation.h>
#import "IComputer.h"

@protocol IComputerFactory <NSObject>

- (id<IComputer>)getComputer;

@end
```
```
// IComputer
#import <Foundation/Foundation.h>

@protocol IComputer <NSObject>

- (void)printInfo;

@end
```
#### Step 2:
创建遵循 `<IComputerFactory>` 协议的电脑工厂类 `AppleComputerFactory` ，并实现协议方法。
```
// .h
#import <Foundation/Foundation.h>
#import "IComputerFactory.h"

// 苹果电脑工厂 -> 遵循电脑工厂协议<IComputerFactory>
@interface AppleComputerFactory : NSObject<IComputerFactory>
@end

// .m
#import "AppleComputerFactory.h"
#import "AppleComputer.h"

@implementation AppleComputerFactory
// 返回具体的电脑
- (id<IComputer>)getComputer {
return [[AppleComputer alloc] init];
}

@end
```
#### Step 3:
创建遵循 `<IComputer>` 协议的电脑类 `AppleComputer` ，并实现协议方法。
```
// .h
#import <Foundation/Foundation.h>
#import "IComputer.h"

// 苹果电脑 -> 遵循电脑协议<IComputer>
@interface AppleComputer : NSObject<IComputer>

@end

// .m
#import "AppleComputer.h"

@implementation AppleComputer

- (void)printInfo {
NSLog(@"生产了一台处理器为2.9 GHz，内存 8GB的苹果电脑");
}

@end
```

#### Step 4:
在需要使用的地方，`#import "AppleComputerFactory.h"`
```
id<IComputerFactory> factory = [[AppleComputerFactory alloc] init];
id<IComputer> computer = [factory getComputer];
[computer printInfo];
```        
控制台效果：            
![](https://upload-images.jianshu.io/upload_images/3265534-28f084aa07e5154b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**通过简单工厂和工厂方法的对比，大家有没有发现简单工厂的一些弊端呢？**
* 拓展性比较差，都在一个类中，不便于多人协同开发；
* 代码冗余，耦合度比较高；

**当然了，没有绝对完美的设计模式，只有适合的设计模式。我们需要根据实际项目需求采用合理的设计模式。**

我在demo中的  `FactoryMethod-Map`  文件夹下实现了地图的工厂方法，感兴趣的可以在文章底部下载代码查看。

### （三）抽象工厂：
**在工厂方法之上进行了再次抽象（protocol）.**
**为创建一组相关或相互依赖的对象提供一个接口（protocol），而且无需指定他们的具体类。**

**抽象工厂和工厂方法的区别：**
* 抽象工厂是为创建一组相关或相互依赖的对象提供一个接口（protocol），工厂方法是一个；
####  建模：
![](https://upload-images.jianshu.io/upload_images/3265534-dd0dde95a68b59db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### Step 1:
根据模型创建抽象工厂协议 `IAbsComputerFactory` 、 `IAbsComputerGraphicsCard` 和 `IAbsComputerCpu` protocol。           
![](https://upload-images.jianshu.io/upload_images/3265534-19847d33443df9f9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
// IAbsComputerFactory
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
```
```
// IAbsComputerGraphicsCard
#import <Foundation/Foundation.h>

// 抽象电脑显卡接口
@protocol IAbsComputerGraphicsCard <NSObject>
// 打印电脑显卡信息
- (void)printInfo;
@end
```
```
// IAbsComputerCpu
#import <Foundation/Foundation.h>

// 抽象电脑Cpu接口
@protocol IAbsComputerCpu <NSObject>
// 打印电脑Cpu信息
- (void)printInfo;
@end
```
#### Step 2:
创建遵循 `<IAbsComputerFactory>` 协议的电脑工厂类 `AbsAppleComputerFactory` ，并实现协议方法。
```
// .h
#import <Foundation/Foundation.h>
#import "IAbsComputerFactory.h"

// 遵循协议 <IAbsComputerFactory> 的实现类
@interface AbsAppleComputerFactory : NSObject<IAbsComputerFactory>

@end

// .m
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
```
#### Step 3:
创建遵循 `<IAbsComputerCpu>` 协议的实现类 `AbsAppleComputerCpu` ，并实现协议方法。
```
// .h
#import <Foundation/Foundation.h>
#import "IAbsComputerCpu.h"

// 遵循协议 <IAbsComputerCpu> 的实现类
@interface AbsAppleComputerCpu : NSObject<IAbsComputerCpu>

@end

// .m
#import "AbsAppleComputerCpu.h"

@implementation AbsAppleComputerCpu

- (void)printInfo {
NSLog(@"生产了一个苹果电脑的CPU。");
}

@end
```
#### Step 4:
创建遵循 `<IAbsComputerGraphicsCard>` 协议的实现类 `AbsAppleComputerGraphicsCard` ，并实现协议方法。
```
// .h 
#import <Foundation/Foundation.h>
#import "IAbsComputerGraphicsCard.h"

// 遵循协议 <IAbsComputerGraphicsCard> 的实现类
@interface AbsAppleComputerGraphicsCard : NSObject<IAbsComputerGraphicsCard>

@end

// .m
#import "AbsAppleComputerGraphicsCard.h"

@implementation AbsAppleComputerGraphicsCard

- (void)printInfo {
NSLog(@"生产了一个苹果电脑的显卡。");
}

@end
```
#### Step 5:
在需要使用的地方，`#import "AbsAppleComputerFactory.h"`
```
id<IAbsComputerFactory> factory = [[AbsAppleComputerFactory alloc] init];
id<IAbsComputerCpu> cpu = [factory getCpu];
[cpu printInfo];
id<IAbsComputerGraphicsCard> graphicsCard = [factory getGraphicsCard];
[graphicsCard printInfo];
```       
控制台效果：            
![](https://upload-images.jianshu.io/upload_images/3265534-27d8549873e7101e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
生产联想电脑的类与上面所述的苹果类如出一辙，这里就不再阐述了。如果以后要拓展其他电脑类，只需要按照这种模式实现就可以了，简直不要太方便~

***
千里之行，始于足下。
***
