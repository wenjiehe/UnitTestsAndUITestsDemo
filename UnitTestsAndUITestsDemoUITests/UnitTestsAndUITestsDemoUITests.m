//
//  UnitTestsAndUITestsDemoUITests.m
//  UnitTestsAndUITestsDemoUITests
//
//  Created by 贺文杰 on 2020/1/19.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTestsAndUITestsDemoUITests : XCTestCase

@end

@implementation UnitTestsAndUITestsDemoUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    //如果发生测试不通过的情况，最好停止程序的运行。
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // UI tests must launch the application that they test.
    //UI测试必须等应用先开启
    XCUIApplication *app = [[XCUIApplication alloc] init];
            [app launch];
    [[[[[[[XCUIApplication alloc] init].otherElements.statusBars childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:0] tap];
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
