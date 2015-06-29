//
//  Log.m
//  invokerDemo
//
//  Created by heaven on 15/6/29.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "Log.h"

@implementation Log

- (NSString *)echo:(XYCommandVO *)vo
{
    return @"log";
}

- (BOOL)isOperate:(XYCommandVO *)vo
{
    return (vo.params.count == 0 && vo.datas.count == 0);
}
@end
