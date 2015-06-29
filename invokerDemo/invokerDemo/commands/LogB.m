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
    NSString *data;
    if (vo.datas.count > 0) {
        data = vo.datas[0];
    }
    else
    {
        data = @"";
    }
    return [NSString stringWithFormat:@"log -b %@", data];
}

// if you want respond this vo, return YES
- (BOOL)isOperate:(XYCommandVO *)vo
{
    if (vo.params.count != 1) return NO;
    
    if (![vo.params containsObject:@"-b"]) return NO;
    
    return YES;
}

@end
