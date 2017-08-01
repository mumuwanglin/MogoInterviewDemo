
#蘑菇租房面试 Demo

###BaseViewController：

我先创建了一个 ```BaseViewController```，让所有 ```ViewController``` 都继承自```BaseViewController```，在 ```BaseViewController``` 中我创建一个父类方法 ```execute()```,所有子类都可以继承这个方法。

###MogoViewController
继承```BaseViewController```，利用多态特性，父类调用子类方法，执行 ```execute``` 方法，加载每个 Controller数据的数据，数据通过 Block 返回

###MogoApi:
模拟数据接口，通过 GDC 创建一个子队列，加入到主线程中，延迟两秒钟执行(模拟真实情况)```DispatchQueue.main.asyncAfter```，并将返回的数据通过 Block 返回。

###UIColor+Random
一个```UIColor```的category，返回一个随机颜色

###MogoTableViewCell
自定义 ```UITableViewCell```，配置 cell 的样式等

###ViewController
主视图控制器，在这个控制器中，只需要把子视图控制器的类名配置进入数组，控制器就会加载子视图。在这个主视图控制器中获取 Block 返回的数据，然后配置 cell 的信息


