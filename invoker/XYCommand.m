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
    NSMutableArray *mArray = [@[] mutableCopy];
    
    Class clazz = NSClassFromString(self.classType);
    [mArray addObject:[[clazz alloc] init]];
    
    
    NSArray *array = [XYCommandLine uxy_subClasses];
    for (NSInteger i = 0; i < array.count; i++)
    {
        Class subClazz = NSClassFromString(array[i]);
        if (![subClazz conformsToProtocol:@protocol(XYCommandParam)])
            continue;
        
        if (![[subClazz performSelector:@selector(name)] isEqualToString:[clazz performSelector:@selector(name)]])
            continue;

        XYCommandLine *commandLine = [[subClazz alloc] init];
        if (i > 0)
        {
            ((XYCommandLine *)[mArray lastObject]).nextOperator = commandLine;
        }
        
        [mArray addObject:commandLine];
    }
    
    self.commands = mArray;
}

@end
