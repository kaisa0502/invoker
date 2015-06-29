//
//  LogA.m
//  invokerDemo
//
//  Created by heaven on 15/6/29.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "LogA.h"

@implementation LogA

- (NSString *)echo:(XYCommandVO *)vo
{
    return @"log -a";
}

- (BOOL)isOperate:(XYCommandVO *)vo
{
    if (vo.params.count != 1) return NO;
    
    if (![vo.params containsObject:@"-a"]) return NO;
    
    return YES;
}

@end
