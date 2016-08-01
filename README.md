# OCPropertyTransfer
- 属性转换，将指定格式的文本转换成属性
- 适合批量转换属性

- ![](OCPropertyTransfer使用.gif)

- 源格式

```objc
姓名  
name
性别
sex
年龄
age
```

- 转换结果

```objc
/// 姓名
@property (nonatomic, strong) NSString *name;
/// 性别
@property (nonatomic, strong) NSString *sex;
/// 年龄
@property (nonatomic, strong) NSString *age;
```
