//
//  NSArray+SafeArr.m
//
//  Created by 青州扛把子 on 2018/3/27.
//  Copyright © 2018年 青州扛把子. All rights reserved.
//

#import "NSArray+SafeArr.h"

#import <objc/runtime.h>

#import <UIKit/UIKit.h>

@implementation NSArray (SafeArr)

- (instancetype)safe_objectAtIndex:(NSUInteger)index
{
    
    //参考：https://blog.csdn.net/miao_em/article/details/50638035
    //@try方法参考：https://www.jianshu.com/p/f28b9b3f8e44
    @try
    {
        return[self safe_objectAtIndex:index];
    }
    @catch (NSException *exception)
    {
        //NSLog(@"-------- %@", [exception callStackSymbols]);
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"数组越界" message:@"通过objectAtIndex方法调用" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * actionOne1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
        }];
        [alert addAction:actionOne1];
        
        //找到顶部视图控制器
        UIWindow * alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        alertWindow.rootViewController = [[UIViewController alloc] init];
        
        alertWindow.windowLevel = UIWindowLevelAlert + 1;
        
        [alertWindow makeKeyAndVisible];
        
        [alertWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        
        return nil;
    }
}
-(instancetype)safe_objectAtIndexedSubscript:(NSUInteger)index
{
    //重写数组通过下标取值的方法（例如：arr[8]），我不知道这个方法具体是怎么实现的，我就从数组取了个越界的值，程序崩溃了，然后在控制台打印了崩溃的方法名
    @try
    {
        return[self safe_objectAtIndexedSubscript:index];
    }
    @catch (NSException *exception)
    {
        //NSLog(@"-------- %@", [exception callStackSymbols]);
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"数组越界" message:@"通过arr[]方法调用" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * actionOne1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                      {
                                      }];
        [alert addAction:actionOne1];
        
        //找到顶部视图控制器
        UIWindow * alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        alertWindow.rootViewController = [[UIViewController alloc] init];
        
        alertWindow.windowLevel = UIWindowLevelAlert + 1;
        
        [alertWindow makeKeyAndVisible];
        
        [alertWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        
        return nil;
    }
}
@end
