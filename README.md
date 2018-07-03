![Alt text](流程图.jpeg)

说明:View 可以是普通的View也可以是ViewController,在需要获取数据的使用VM对数据源进行订阅，然后调用者通过调用VM的请求方法。回调将在订阅处触发。整个流程如上图。