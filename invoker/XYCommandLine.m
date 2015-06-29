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

+ (NSString *)operateParam
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
    NSMutableString *result = [@"" mutableCopy];
    
    if ([self commandEnabled:vo])
    {
        [result appendString:[self echo:vo]];
    }
    
    if (self.nextOperator)
    {
        NSString *str = [self.nextOperator handleMessage:vo];
        [result appendString:str];
    }
    
    return result;
}

- (BOOL)commandEnabled:(XYCommandVO *)vo
{
    if (!self.enabled)
        return NO;
    
    if ([[[self class] operateParam] isEqualToString:@"..."])
        return YES;
    
    return ([vo.params containsObject:[[self class] operateParam]]);
}
@end
