//
//  XYInvoker.m
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "XYInvoker.h"
#import "XYCommandVO.h"
#import "XYCommandConfig.h"
#import "XYCommand.h"

@interface XYInvoker ()

//@property (nonatomic, strong) XYCommandVO *commandVO;
@property (nonatomic, strong) XYCommandConfig *commandConfig;

@end

@implementation XYInvoker

- (NSString *)exec:(NSString *)strCommand
{
    NSString *result;
    XYCommandVO *vo = [XYCommandVO commandVOWithCommandString:strCommand];
    
    if (![self.commandConfig isPerformOfCommand:vo.name])
    {
        result = @"can not perform";
        
        return result;
    }
    
    NSString *classType = [self.commandConfig commandClassOfName:vo.name];
    
    XYCommand *command = [XYCommand commandWithClassType:classType];
    result = [command execute:vo];
    
    return result;
}

#pragma mark - private

#pragma mark - getter setter
- (XYCommandConfig *)commandConfig
{
    return _commandConfig ?: (_commandConfig = [[XYCommandConfig alloc] init], _commandConfig);
}

@end
