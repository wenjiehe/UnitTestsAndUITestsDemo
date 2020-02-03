//
//  ToolTests.m
//  UnitTestsAndUITestsDemoTests
//
//  Created by 贺文杰 on 2020/1/29.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ToolTests : XCTestCase<XCUIScreenshotProviding>

@end

@implementation ToolTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testScreenShot{
    [XCTContext runActivityNamed:@"Launch" block:^(id<XCTActivity>  _Nonnull activity) {
        XCUIApplication *app = [[XCUIApplication alloc] init];
        app.launchArguments = @[@"-StartFromSlate", @"YES"];
        [app launch];
    }];
    
    [XCTContext runActivityNamed:@"ScreenShots" block:^(id<XCTActivity>  _Nonnull activity) {
        //生成主屏幕截图
        XCUIScreenshot *screenShot = [[XCUIScreen mainScreen] screenshot];
        //将截屏添加到附件中
        XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:screenShot];
        //确保测试成功后attachment不会被自动删除
        attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
        [activity addAttachment:attachment];
    }];
}

- (void)testAssert
{
//    XCTFail(<#...#>)
    
    NSString *str = nil;
    NSString *string = @"";
    
    //str为nil时通过，反之不通过
//    XCTAssertNil(str, @"str is nil");
    
    //str不为nil时通过，反之不通过
//    XCTAssertNotNil(str, @"str is not nil");
    
    //判断expression值是否为真，当为true时通过
//    XCTAssert(1, @"str is true");
    
    //判断expression值是否为真，当为true时通过
//    XCTAssertTrue(0, @"str is true");
    
    //判断expression值是否为假，当为false时通过
    XCTAssertFalse(0, @"str is true");
    
    XCTAssertEqualObjects(str, string, @"相等判断");
}

@end
