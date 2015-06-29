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
    return @"-b";
}

+ (NSString *)operateParam
{
    return @"-b";
}

@end
