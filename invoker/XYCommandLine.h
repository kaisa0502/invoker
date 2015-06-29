//
//  XYCommandName.h
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYCommandVO.h"

@protocol XYCommandParam <NSObject>
+ (NSString *)name;
- (NSString *)operateParam;
@end

@protocol XYCommand <NSObject>
+ (NSString *)name;
@end

@interface XYCommandLine : NSObject

@property (nonatomic, assign, getter=isEnabled) BOOL enabled;
//@property (nonatomic, assign, getter=isHeader) BOOL header;

@property (nonatomic, assign) XYCommandLine *nextOperator;

#pragma mark - rewirte method
- (NSString *)echo:(XYCommandVO *)vo;
@end
