//
//  XYCommandVO.h
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYCommandVO : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSSet *params;
@property (nonatomic, strong, readonly) NSArray *datas;

+ (instancetype)commandVOWithCommandString:(NSString *)commandString;

@end
