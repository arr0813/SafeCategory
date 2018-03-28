//
//  NSMutableDictionary+SafeDic.m
//
//  Created by 青州扛把子 on 2018/3/28.
//  Copyright © 2018年 青州扛把子. All rights reserved.
//

#import "NSMutableDictionary+SafeDic.h"

#import <objc/runtime.h>

#import <UIKit/UIKit.h>

@implementation NSMutableDictionary (SafeDic)
- (void)safe_setObject:(id)emObject forKey:(NSString *)key
{
    if (emObject == nil)
    {
        @try
        {
            [self safe_setObject:emObject forKey:key];
        }
        @catch (NSException *exception)
        {
            //NSLog(@"%@", [exception callStackSymbols]);
            emObject = [NSString stringWithFormat:@""];
            
            [self safe_setObject:emObject forKey:key];
            
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"字典传入了一个空值" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
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
        }
        @finally {}
    }
    else
    {
        [self safe_setObject:emObject forKey:key];
    }
}
@end
