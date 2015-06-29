//
//  XYCommandName.h
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYCommandVO.h"

@protocol XYAbstractCommand <NSObject> @end
@protocol XYCommand <NSObject> @end

@interface XYCommandLine : NSObject

@property (nonatomic, assign, getter=isEnabled) BOOL enabled;
//@property (nonatomic, assign, getter=isHeader) BOOL header;

@property (nonatomic, assign) XYCommandLine *nextOperator;

#pragma mark - rewirte method
- (NSString *)echo:(XYCommandVO *)vo;

// if you want respond this vo, return YES
- (BOOL)isOperate:(XYCommandVO *)vo;

+ (NSString *)name;

@end
