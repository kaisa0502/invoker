//
//  XYCommandVO.m
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "XYCommandVO.h"

@interface XYCommandVO ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSSet *params;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation XYCommandVO

+ (instancetype)commandVOWithCommandString:(NSString *)commandString
{
    if (commandString.length < 1) return nil;
    
    NSArray *array = [commandString componentsSeparatedByString:@" "];
    XYCommandVO *vo = [[XYCommandVO alloc] init];
    vo.name = [array objectAtIndex:0];
    
    NSMutableSet *mSet = [NSMutableSet set];
    NSMutableArray *mArray = [@[] mutableCopy];
    
    for (int i = 1; i < array.count; i++)
    {
        NSString *tmpStr =  array[i];
        [tmpStr hasPrefix:@"-"] ? [mSet addObject:tmpStr] : [mArray addObject:tmpStr];
    }
    vo.params = mSet;
    vo.datas = mArray;
    
    return vo;
}
@end
