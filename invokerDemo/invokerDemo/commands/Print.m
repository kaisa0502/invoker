//
//  Print.m
//  invokerDemo
//
//  Created by heaven on 15/6/29.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "Print.h"

@implementation Print

- (NSString *)echo:(XYCommandVO *)vo
{
    NSMutableString *str = [@"print" mutableCopy];
    if (vo.datas.count > 0)
        [str appendFormat:@" %@", vo.datas[0]];
    
    if (vo.params.count > 0)
        [str appendFormat:@" %@", vo.params];
    
    return str;
}

- (BOOL)isOperate:(XYCommandVO *)vo
{
    return YES;
}

@end
