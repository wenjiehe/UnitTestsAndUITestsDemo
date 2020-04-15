//
//  HomeTests.m
//  UnitTestsAndUITestsDemoTests
//
//  Created by 贺文杰 on 2020/1/29.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface HomeTests : XCTestCase

@property(nonatomic)NSInteger k;

@end

@implementation HomeTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    //用代码生成的控件，使用以下方式获取控件:
////    XCUIElement *tableView = [app.tables elementBoundByIndex:0];
//    //使用storyboard生成的控件，使用以下方式获取控件:
//    XCUIElement *tableView = app.tables[@"tablev"];
//    if (tableView.tableRows.count > 0) {
//        XCUIElement *tableViewCell = [tableView.tableRows elementBoundByIndex:0];
//
//    }
    

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        BOOL isStart = NO;
        for (NSInteger i = 0; i < 10000; i++) {
            if (!isStart) {
                isStart = YES;
                _k++;
            }
            NSLog(@"%ld", i);
        }
        NSLog(@"kkkkk = %ld", _k);
    }];
}

@end
