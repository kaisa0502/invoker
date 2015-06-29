//
//  XYCommandConfig.m
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "XYCommandConfig.h"
#import "XYCommandLine.h"
#import "XYClassUtils.h"

@interface XYCommandConfig ()

@property (nonatomic, strong) NSMutableDictionary *commandHeaders;

@end

@implementation XYCommandConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupCommandHeaders];
    }
    return self;
}

- (BOOL)isPerformOfCommand:(NSString *)name
{
    return (self.commandHeaders[name] != nil);
}

- (NSString *)commandClassOfName:(NSString *)name
{
    return self.commandHeaders[name];
}

#pragma mark- private
- (void)setupCommandHeaders
{
    NSArray *array = [XYCommandLine uxy_subClasses];
    NSMutableDictionary *mDic = [@{} mutableCopy];
    for (NSString *classType in array)
    {
        Class clazz = NSClassFromString(classType);
        if ([clazz conformsToProtocol:@protocol(XYAbstractCommand) ] && ![clazz conformsToProtocol:@protocol(XYCommand)])
        {
            mDic[[clazz performSelector:@selector(name)]] = classType;
        }
    }
    self.commandHeaders = mDic;
}

@end
