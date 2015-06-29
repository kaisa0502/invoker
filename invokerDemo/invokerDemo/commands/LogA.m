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
    return @"-a";
}

+ (NSString *)operateParam
{
    return @"-a";
}

@end
