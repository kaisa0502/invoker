//
//  XYCommand.m
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "XYCommand.h"
#import "XYClassUtils.h"
#import "XYCommandLine.h"

@interface XYCommand ()

@property (nonatomic, copy) NSString *classType;
@property (nonatomic, strong) NSArray *commands;

@end

@interface XYCommandLine (XYCommand)
- (NSString *)handleMessage:(XYCommandVO *)vo;
@end

@implementation XYCommand

+ (instancetype)commandWithClassType:(NSString *)name
{
    XYCommand *command = [[XYCommand alloc] init];
    command.classType = name;
    [command buildChain];
    
    return command;
}

- (NSString *)execute:(XYCommandVO *)vo
{
    XYCommandLine *commandName = _commands[0];
    return [commandName handleMessage:vo];
}

#pragma mark - private
- (void)buildChain
{
    NSArray *array = [NSClassFromString(self.classType) uxy_subClasses];
    NSMutableArray *mArray = [@[] mutableCopy];
    
    for (NSInteger i = 0; i < array.count; i++)
    {
        XYCommandLine *commandName = [[NSClassFromString(array[i]) alloc] init];
        if (i > 0)
        {
            ((XYCommandLine *)mArray[i - 1]).nextOperator = commandName;
        }
        [mArray addObject:commandName];
    }
    
    self.commands = mArray;
}

@end
