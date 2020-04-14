//
//  HomeTest.m
//  UnitTestsAndUITestsDemoUITests
//
//  Created by 贺文杰 on 2020/4/15.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HomeTest : XCTestCase

@end

@implementation HomeTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    


    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
//    [[[[[[XCUIApplication alloc] init].tables.collectionViews childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element tap];


    XCUIElementQuery *tablesQuery = [[XCUIApplication alloc] init].tables;
    NSInteger count = tablesQuery.cells.count;
    if (count > 0) {
        [[tablesQuery.cells elementBoundByIndex:0] tap];
    }

//    XCUIElement *cell = [[tablesQuery childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:0];
//    [cell tap];

                
}

@end
