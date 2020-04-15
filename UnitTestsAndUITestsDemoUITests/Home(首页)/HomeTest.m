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
    //https://www.jianshu.com/p/cf445a2f5f5b
    XCUIApplication *app = [XCUIApplication new];
    [app launch]; //启动app
    [app activate]; //激活app:如果app进入后台，可以用这个方法激活启动到前台
    [app terminate]; //终止所有app

    switch ([app state]) {
        case XCUIApplicationStateUnknown:
            //未知状态
            break;
        case XCUIApplicationStateNotRunning:
            //未运行
            break;
        case XCUIApplicationStateRunningBackgroundSuspended:
            //后台运行但被挂起
            break;
        case XCUIApplicationStateRunningBackground:
            //后台运行
            break;
        case XCUIApplicationStateRunningForeground:
            //正在前台运行
            break;
        default:
            break;
    }
    
    //查询类型
    XCUIElementQuery *buttons = [app descendantsMatchingType:XCUIElementTypeButton];
    
    if (buttons.count > 0) {
        XCUIElement *button = [buttons elementBoundByIndex:0];
        if (button.exists) {//确定元素是否存在
            [button tap]; //单个点击事件
            [button doubleTap]; //双击事件
//            button.hittable; //是否可以计算元素的命中点
//            button.debugDescription; //提供有关元素的调试信息
            [button typeText:@""]; //在元素中输入一个字符串
            [button pressForDuration:3]; //发送长按手势，并指定时间
            [button pressForDuration:3 thenDragToElement:button]; //发送长按手势，并指定时间
            
            [button swipeLeft]; //
        }
    }
    


    XCUIElementQuery *tablesQuery = [[XCUIApplication alloc] init].tables;
    NSInteger count = tablesQuery.cells.count;
    if (count > 0) {
        [[tablesQuery.cells elementBoundByIndex:0] tap];
    }

//    XCUIElement *cell = [[tablesQuery childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:0];
//    [cell tap];

                
}

@end
