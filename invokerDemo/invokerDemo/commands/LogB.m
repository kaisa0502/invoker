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
    NSMutableString *str = [@"log -b" mutableCopy];
    if (vo.datas.count > 0)
        [str appendFormat:@" %@", vo.datas[0]];

    return str;
}

- (BOOL)isOperate:(XYCommandVO *)vo
{
    if (vo.params.count != 1) return NO;
    
    if (![vo.params containsObject:@"-b"]) return NO;
    
    return YES;
}

- (NSString *)operateParam
{
    return @"-b";
}

@end
