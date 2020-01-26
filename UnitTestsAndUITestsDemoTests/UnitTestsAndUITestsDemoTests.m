//
//  UnitTestsAndUITestsDemoTests.m
//  UnitTestsAndUITestsDemoTests
//
//  Created by 贺文杰 on 2020/1/19.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTestsAndUITestsDemoTests : XCTestCase

@end

@implementation UnitTestsAndUITestsDemoTests


/// 每个类中测试方法调用前，先调用这个方法以便开发者做些测试前的准备
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

/// 当这个类中的所有测试方法测试完后，会调用这个方法，释放测试用例的资源代码
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

/// 测试用例的方法
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

/// 代码性能测试的方法，把要测试的方法放进Block中即可，也可使用Instrument来代替它
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testBook{
    
}

@end
