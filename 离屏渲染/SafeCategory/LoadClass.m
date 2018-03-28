//
//  LoadClass.m
//  
//
//  Created by 青州扛把子 on 2018/3/27.
//  Copyright © 2018年 青州扛把子. All rights reserved.
//

#import "LoadClass.h"
#import <objc/runtime.h>
@implementation LoadClass
+(void)load
{
    /*
     实例方法用：class_getInstanceMethod
     类方法用：class_getInstanceMethod
     注意：使用class_getInstanceMethod时，NSArray等类簇要使用其真身
     
                        类簇                  真身
                      NSArray              __NSArrayI
                   NSMutableArray          __NSArrayM
                    NSDictionary          __NSDictionaryI
                NSMutableDictionary       __NSDictionaryM
     */
    //Array --- objectAtIndex方法
    Method fromMethodArr = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethodArr = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(safe_objectAtIndex:));
    method_exchangeImplementations(fromMethodArr, toMethodArr);
    
    //Array --- arr[N]方法
    Method fromMethodArr1 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndexedSubscript:));
    Method toMethodArr1 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(safe_objectAtIndexedSubscript:));
    method_exchangeImplementations(fromMethodArr1, toMethodArr1);
    
    //NSMutableArray --- objectAtIndex方法
    Method fromMethodMutArr = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
    Method toMethodMutArr = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safe_objectAtIndex:));
    method_exchangeImplementations(fromMethodMutArr, toMethodMutArr);
    
    //NSMutableArray --- arr[N]方法
    Method fromMethodMutArr1 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndexedSubscript:));
    Method toMethodMutArr1 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safe_objectAtIndexedSubscript:));
    method_exchangeImplementations(fromMethodMutArr1, toMethodMutArr1);
    
    //NSMutableDictionary --- setObject: forKey:方法
    Method fromMethodDic = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:));
    Method toMethodDic = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(safe_setObject:forKey:));
    method_exchangeImplementations(fromMethodDic, toMethodDic);
}
@end
