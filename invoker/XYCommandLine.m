//
//  XYCommandName.m
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "XYCommandLine.h"

@implementation XYCommandLine

- (instancetype)init
{
    self = [super init];
    if (self) {
        _enabled = YES;
    }
    return self;
}

#pragma mark - rewirte method
- (NSString *)echo:(XYCommandVO *)vo
{
    return  NSStringFromClass([self class]);
}

- (BOOL)isOperate:(XYCommandVO *)vo
{
    return YES;
}

- (NSString *)operateParam
{
    return @"...";
}

+ (NSString *)name
{
    return NSStringFromClass(self);
}

#pragma mark - private
- (NSString *)handleMessage:(XYCommandVO *)vo
{
    NSString *result = @"";
    
    if (self.enabled && ([vo.params containsObject:[self operateParam]] || [[self operateParam] isEqualToString:@"..."]))
    {
        result = [self echo:vo];
    }
    
    if (self.nextOperator)
    {
        result = [self.nextOperator handleMessage:vo];
        return result;
    }
    
    result = @"error";
    
    return result;
}

@end
