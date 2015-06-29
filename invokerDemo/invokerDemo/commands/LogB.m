//
//  LogB.m
//  invokerDemo
//
//  Created by heaven on 15/6/29.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "LogB.h"

@implementation LogB

- (NSString *)echo:(XYCommandVO *)vo
{
    return @"log";
}

// if you want respond this vo, return YES
- (BOOL)isOperate:(XYCommandVO *)vo
{
    if (vo.datas.count > 0) return NO;
    if (vo.params.count != 1) return NO;
    
    if (![vo.params containsObject:@"-b"]) return NO;
    
    return YES;
}

@end
