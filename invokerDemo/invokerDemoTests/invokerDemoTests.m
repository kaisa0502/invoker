//
//  invokerDemoTests.m
//  invokerDemoTests
//
//  Created by XingYao on 15/6/27.
//  Copyright (c) 2015年 XingYao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "XYCommand.h"
#import "XYInvoker.h"
#import "XYCommandVO.h"
#import "XYClassUtils.h"

@interface invokerDemoTests : XCTestCase
@property XYInvoker *invoker;
@end

@implementation invokerDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.invoker = [[XYInvoker alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.invoker = nil;
    
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testVO {
    XYCommandVO *vo = [XYCommandVO commandVOWithCommandString:@"log -a bb"];
    XCTAssert(vo, @"Pass");
    XCTAssert([vo.name isEqualToString:@"log"], @"Pass");
    XCTAssert(vo.params.count == 1, @"Pass");
    XCTAssert(vo.datas.count == 1, @"Pass");
}

- (void)test1 {
    // This is an example of a functional test case.
    NSString *str = [_invoker exec:@"log"];
    XCTAssert(str.length > 0, @"Pass");
}

- (void)test2 {
    // This is an example of a functional test case.
    NSString *str = [_invoker exec:@"log -a"];
    XCTAssert([str isEqualToString:@"log -a"], @"Pass");
}

- (void)test3 {
    // This is an example of a functional test case.
    NSString *str = [_invoker exec:@"log -a -b"];
    XCTAssert([str isEqualToString:@"error"], @"Pass");
}

- (void)test4 {
    // This is an example of a functional test case.
    NSString *str = [_invoker exec:@"log -b"];
    XCTAssert([str isEqualToString:@"log -b"], @"Pass");
}

- (void)test5 {
    // This is an example of a functional test case.
    NSString *str = [_invoker exec:@"log -b data"];
    XCTAssert([str isEqualToString:@"log -b data"], @"Pass");
}

- (void)test6 {
    // This is an example of a functional test case.
    NSString *str = [_invoker exec:@"print"];
    XCTAssert([str isEqualToString:@"print"], @"Pass");
}

- (void)test7 {
    // This is an example of a functional test case.
    NSString *str = [_invoker exec:@"print -x -y"];
    XCTAssert(str.length > 0, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
