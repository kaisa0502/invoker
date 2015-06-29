//
//  XYCommand.h
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XYCommandVO;

@interface XYCommand : NSObject

+ (instancetype)commandWithClassType:(NSString *)name;

- (NSString *)execute:(XYCommandVO *)vo;

@end
