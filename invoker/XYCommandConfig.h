//
//  XYCommandConfig.h
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYCommandConfig : NSObject

- (BOOL)isPerformOfCommand:(NSString *)name;

- (NSString *)commandClassOfName:(NSString *)name;

@end
