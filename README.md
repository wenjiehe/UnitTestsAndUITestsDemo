# UnitTestsAndUITestsDemo

## 编译环境

* Xcode 11.3.1
* Mac OS 10.15.2
* Objective-C 2.0

## 简介

单元测试(`unit testing`)，是指对软件中的最小可测试单元进行检查和验证。对于单元测试中单元的含义，一般来说，要根据实际情况去判定其具体含义，如C语言中单元指一个函数，Java里单元指一个类，图形化的软件中可以指一个窗口或一个菜单等。总的来说，单元就是认为规定的最小的被测功能模块。单元测试是在软件开发过程中要进行的最低级别的测试活动，软件的独立单元将在与程序的其他部分相隔离的情况下进行测试。

经常与单元测试联系起来的另外一些开发活动包括代码审查（`Code review`），静态分析（`Static analysis`）和动态分析（`Dynamic analysis`）。静态分析就是对软件的源代码进行研读，查找错误或收集一些度量数据，并不需要对代码进行编译和执行。动态分析就是通过观察软件运行时的动作，来提供执行跟踪，时间分析，以及测试覆盖度方面的信息。

XCTest是Xcode提供的一种自动测试框架。

UITests是通过代码化来实现自动点击界面，输入文字等功能。这样解决了大量靠人工操作的测试方式，尤其是需要花费相当多时间的回归测试。

1. Unit Tests

    - 单元测试与应用程序属于共存关系，而非嵌入关系，所以必须创建一个单独的测试目标。
    
    - 可以在单元测试类中编写单独的测试用例方法，这些方法与普通的方法类似，但是方法名称必须以`test`开发，且不能有参数，不然不会识别为测试方法。
    
    - 单元调试操作，两种方法，按快捷键Command + U进行全部单元测试。也可单独点击播放按钮进行测试
    
    - 测试通过会有一个绿色的钩，没通过的是一个红色的叉。

2. UI Tests

    - 测试UI点击、输入事件、赋值、双击、页面的滚动
    
    - 可以录制操作过程，将光标放在自定义的测试方法中，可以点击`Debug`调试区的红色圆点，程序就会自动启动，这时间在程序中所有的操作都会生成相应的代码，并将代码放到所选的测试方法内。录制的代码不一定正确，需要自行调整
    
    - `XCUIApplication *app = [[XCUIApplication alloc] init];`和`[app launch];`可以获取当前界面的元素。

3. 测试方法

```Objective-C
///Unit Tests方法
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
```

```Objective-C
///UI Tests方法
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
```

4. 代码覆盖率

`Code Coverage`是一个计算你的单元测试覆盖率的工具。在运行测试之前，我们需确认`Code Coverage`是否被打开，默认是关闭状态，所以需编辑`Edit scheme... -> Test -> Options -> Gather coverage for (勾选，这里可以选择部分targets)`，然后我们就使用`Command + U`运行所有测试类，编译成功后，就可以在`Show the Report navigator`中的`Coverage`中看到对应的targets，可以看到类文件及类文件里面的方法列表，并展示所有的测试覆盖情况。双击方法的名称，Xcode会打开类的代码，并且看到`Code Coverage`的情况，及代码的执行次数。

![Code coverage](https://github.com/wenjiehe/UnitTestsAndUITestsDemo/blob/master/UnitTestsAndUITestsDemo/CodeCoverage1.png)

![Code Coverage](https://github.com/wenjiehe/UnitTestsAndUITestsDemo/blob/master/UnitTestsAndUITestsDemo/CodeCoverage.png)

5. Test Plan File

> 测试计划文件实际上就是个JSON文件，以`.xctestplan`为扩展名，它包含你要运行的所有测试，以及描述测试如何运行的所有测试配置

6. 测试报告文件

> 打开访达（`Finder`），输入`Command+shift+G`，输入`~/`，进入`资源库->Developer->Xcode->DerivedData->对应项目->Logs->Test->.xcresult`，`.xcresult`是一个结果捆绑包，包含了`Build`、`Coverage`、`Log`，可以在`Xcode中`直接打开

```
//使用命令生成结果捆绑包（.xcresult），name和id不能同时使用
xcodebuild test -project UnitTestsAndUITestsDemo.xcodeproj -scheme UnitTestsAndUITestsDemo -destination 'platform=iOS Simulator,OS=13.3,name=iPhone 11 Pro Max'

//多个设备并行测试
xcodebuild test -project UnitTestsAndUITestsDemo.xcodeproj -scheme UnitTestsAndUITestsDemo -destination 'platform=iOS Simulator,OS=13.3,name=iPhone 11 Pro Max' -destination 'platform=iOS Simulator,OS=13.3,name=iPhone 8'
```

7. xcresulttool

> xcresulttool可以访问.xcresult的内容，这是Xcode 11的新命令行工具,提取测试失败

```C
//在命令行或脚本中使用，输出json格式的数据，ResultBundle.xcresult（传入结果捆绑包的路径）
xcrun xcresulttool get --path ResultBundle.xcresult --format json
```

8. xccov

> xccov 是一个全新的用于输出代码覆盖率的命令行工具，可以很方便地集成在脚本中，它能产生对人和对机器都可读的输出，还能输出覆盖数据的详细视图。

```C
//在命令行中查看测试覆盖率报告
xcrun xccov view --report xxx.xcresult

//使用diff比较两个报告的测试覆盖率是否有增加或减少
xcrun xccov diff --json before.xcresult after.xcresult
```

9. 性能测试报告

> measureBlock中会对代码运行10次，得到10次运行的时间，及平均值、相对标准偏差，基线平均值等

![性能测试](https://github.com/wenjiehe/UnitTestsAndUITestsDemo/blob/master/UnitTestsAndUITestsDemo/ceshi.png)

![性能测试输出](https://github.com/wenjiehe/UnitTestsAndUITestsDemo/blob/master/UnitTestsAndUITestsDemo/ceshi1.png)

Average: 平均值

Baseline: 基线值

Max STDDEV:最大标准偏差


## XCTest框架及API介绍

```Objective-C
//继承于XCUIElement，掌管应用程序的生命周期
#import <XCTest/XCUIApplication.h>
//宏定义的断言函数
#import <XCTest/XCTestAssertions.h>
```

## 参考资料

 [wwdc-2017-新的测试内容](https://developer.apple.com/videos/play/wwdc2017/409)

 [wwdc-2018-关于测试](https://developer.apple.com/videos/play/wwdc2018/403)

 [wwdc-2019-XCTest自动测试框架](https://developer.apple.com/videos/play/wwdc2019/413/)
 
 [xcodebuild test](https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-UNIT)
 
