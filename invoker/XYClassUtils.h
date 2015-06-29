//
//  XYClassUtils.h
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYClassUtils : NSObject

@end

@interface NSObject (uxyRuntime)

+ (NSArray *)uxy_subClasses;

+ (NSArray *)uxy_classesWithProtocol:(NSString *)protocolName;

+ (NSArray *)uxy_superclassesWithProtocol:(NSString *)protocolName;

@end