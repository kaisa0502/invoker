//
//  XYClassUtils.m
//  invokerDemo
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import "XYClassUtils.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation XYClassUtils

@end

@implementation NSObject(uxyRuntime)

+ (NSArray *)uxy_subClasses
{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    for ( NSString *className in [self __loadedClassNames] )
    {
        Class classType = NSClassFromString( className );
        if ( classType == self )
            continue;
        
        if ( NO == [classType isSubclassOfClass:self] )
            continue;
        
        [results addObject:[classType description]];
    }
    
    return results;
}

+ (NSArray *)uxy_classesWithProtocol:(NSString *)protocolName
{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    Protocol * protocol = NSProtocolFromString(protocolName);
    for ( NSString *className in [self __loadedClassNames] )
    {
        Class classType = NSClassFromString( className );
        if ( classType == self )
            continue;
        
        if ( NO == [classType conformsToProtocol:protocol] )
            continue;
        
        [results addObject:[classType description]];
    }
    
    return results;
}

#pragma mark - private
+ (NSArray *)__loadedClassNames
{
    static dispatch_once_t once;
    static NSMutableArray *classNames;
    
    dispatch_once( &once, ^
                  {
                      unsigned int classesCount = 0;
                      
                      classNames     = [[NSMutableArray alloc] init];
                      Class *classes = objc_copyClassList( &classesCount );
                      
                      for ( unsigned int i = 0; i < classesCount; ++i )
                      {
                          Class classType = classes[i];
                          
                          if ( class_isMetaClass( classType ) )
                              continue;
                          
                          Class superClass = class_getSuperclass( classType );
                          
                          if ( nil == superClass )
                              continue;
                          
                          [classNames addObject:[NSString stringWithUTF8String:class_getName(classType)]];
                      }
                      
                      [classNames sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                          return [obj1 compare:obj2];
                      }];
                      
                      free( classes );
                  });
    
    return classNames;
}

@end