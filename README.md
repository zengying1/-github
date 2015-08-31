# zjk
曾盈
###1.
####@synthesize

编译器期间，让编译器自动生成getter/setter方法。当有自定义的存或取方法时，自定义会屏蔽自动生成该方法

####@dynamic

告诉编译器，不自动生成getter/setter方法，避免编译期间产生警告然后由自己实现存取方法或存取方法在运行时动态创建绑定：主要使用在CoreData的实现NSManagedObject子类时使用，由Core Data框架在程序运行的时动态生成子类属性

####@property
作用是定义属性，声明getter,setter方法。 

###2.为什么以下操作不能直接赋值

```objective-c
UIView *view = [[UIView alloc] init];
view.frame.size.width = 5;// ------ ①
```
答：没有初始化view的位置。

###3.
获取班级名称：
```objective-c
>\s*<br>(.*)<br>\S
```
获取班级号：
```objective-c
<br>.*：(.*)<br>
```
