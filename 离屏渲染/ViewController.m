//
//  ViewController.m
//  离屏渲染
//
//  Created by 王修帅 on 2018/3/27.
//  Copyright © 2018年 王修帅. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray * arr = @[@1,@2];
    NSLog(@"--->%@",arr[4]);
    NSLog(@"--->%@",[arr objectAtIndex:1]);
    NSLog(@"--->%@",[arr objectAtIndex:4]);

    NSMutableArray * mutArr = [NSMutableArray arrayWithArray:@[@1,@2]];

    NSLog(@"1--->%@",mutArr[1]);
    NSLog(@"2--->%@",mutArr[4]);
    NSLog(@"3--->%@",[mutArr objectAtIndex:1]);
    NSLog(@"4--->%@",[mutArr objectAtIndex:4]);


    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:@{@"1":@"01"}];
    [dic setObject:nil forKey:@"3"];



//    id obj = nil;
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    [dict setObject:obj forKey:@"666"];
//
//    UIScrollView * backSCView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//
//    [backSCView setBackgroundColor:[UIColor cyanColor]];
//
//    [backSCView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 80)];
//    [backSCView setPagingEnabled:YES];
//    [self.view addSubview:backSCView];
//
//    for (NSInteger i = 0; i < 480; i ++)
//    {
//        CGFloat X = 50;
//        CGFloat Y = [UIScreen mainScreen].bounds.size.height/6*i + 15;
//        CGFloat W = [UIScreen mainScreen].bounds.size.height/6 - 15;
//        CGFloat H = [UIScreen mainScreen].bounds.size.height/6 - 15;
//
//        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
//        [img setImage:[UIImage imageNamed:@"MeiNv"]];
//        [img setContentMode:UIViewContentModeScaleAspectFill];
//        [img setClipsToBounds:YES];
//        [img.layer setMasksToBounds:YES];
//        [img.layer setCornerRadius:W/2];
//        [backSCView addSubview:img];
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
