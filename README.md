# UnitTestsAndUITestsDemo


## 简介

单元测试(`unit testing`)，是指对软件中的最小可测试单元进行检查和验证。对于单元测试中单元的含义，一般来说，要根据实际情况去判定其具体含义，如C语言中单元指一个函数，Java里单元指一个类，图形化的软件中可以指一个窗口或一个菜单等。总的来说，单元就是认为规定的最小的被测功能模块。单元测试是在软件开发过程中要进行的最低级别的测试活动，软件的独立单元将在与程序的其他部分相隔离的情况下进行测试。

经常与单元测试联系起来的另外一些开发活动包括代码走读（`Code review`），静态分析（`Static analysis`）和动态分析（`Dynamic analysis`）。静态分析就是对软件的源代码进行研读，查找错误或收集一些度量数据，并不需要对代码进行编译和执行。动态分析就是通过观察软件运行时的动作，来提供执行跟踪，时间分析，以及测试覆盖度方面的信息。

XCTest是苹果自带的测试框架

UITests是通过代码化来实现自动点击界面，输入文字等功能。这样解决了大量靠人工操作的测试方式，尤其是需要话费相当多的时间来进行回归测试及环境切换测试。

1. Unit Tests

    - 单元测试与应用程序属于共存关系，而非嵌入关系，所以必须创建一个单独的测试目标。
    
    - 可以在单元测试类中编写单独的测试用例方法，这些方法与普通的方法类似，但是方法名称必须以`test`开发，且不能有参数，不然不会识别为测试方法。
    
    - 单元调试操作，两种方法，按快捷键Command + U进行全部单元测试。
    
    - 也可在Show the Test navigator中点击测试方法的播放按钮

2. UI Tests

3. 测试方法

```
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

4. 代码覆盖率

`Code Coverage`是一个计算你的单元测试覆盖率的工具。在运行测试之前，我们需确认`Code Coverage`是否被打开，默认是关闭状态，所以需编辑`Edit scheme... -> Test -> Options -> Gather coverage for (勾选，这里可以选择部分targets)`，然后我们就使用`Command + U`运行所有测试类，编译成功后，就可以在`Show the Report navigator`中的`Coverage`中看到对应的targets，可以看到类文件及类文件里面的方法列表，并展示所有的测试覆盖情况。双击方法的名称，Xcode会打开类的代码，并且看到`Code Coverage`的情况，及代码的执行次数。

![Code coverage](https://github.com/wenjiehe/UnitTestsAndUITestsDemo/blob/master/UnitTestsAndUITestsDemo/CodeCoverage1.png)

![Code Coverage](https://github.com/wenjiehe/UnitTestsAndUITestsDemo/blob/master/UnitTestsAndUITestsDemo/CodeCoverage.png)

## XCTest框架及API介绍

## 参考资料

 [wwdc-2017-新的测试内容](https://developer.apple.com/videos/play/wwdc2017/409)

 [wwdc-2018-关于测试](https://developer.apple.com/videos/play/wwdc2018/403)

 [wwdc-2019-XCTest自动测试框架](https://developer.apple.com/videos/play/wwdc2019/413/)
 
