//: Playground - noun: a place where people can play

import UIKit

#if false
var str = "Hello, playground"
print(str)
#endif

// ### 常量&变量
/**
 常量和变量的使用注意:
 1.在Swift中规定:在定义一个标识符时必须明确说明该标识符是一个常量还是变量;使用let来定义常量,定义之后不可以修改;使用var来定义变量,定义之后可以修改
 2.在真实使用过程中,建议先定义常量,如果需要修改再修改为变量(更加安全)
 3.指向的对象不可以再进行修改,但是可以通过指针获得对象后,修改对象内部的属性
*/
let view : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)) // view : UIView = [[UIView alloc] init];
view.backgroundColor = UIColor.red



// ### 数据类型
/**
 Swift中的类型推导
 Swift是强类型的语言
 Swift中任何一个标识符都有明确的类型
 注意:
 如果定义一个标识符时有直接进行赋值,那么标识符后面的类型可以省略
 因为Swift有类型推导,会自动根据后面的赋值来决定前面的标识符的数据类型
 */



// ### 逻辑分支
// ## if分支语句
/**
 与Objective-C的区别:
 1.判断句可以不加()
 2.在Swift的判断句中必须有明确的真假
   1)不再有非0即真
   2)必须有明确的Bool值
   3)Bool有两个取值:false/true
 */
let a = 10
if a > 9 {
    print(a)
}


// ## guard
/**
 guard是Swift2.0新增的语法
 它与if语句非常类似，它设计的目的是提高程序的可读性
 guard语句必须带有else语句，它的语法如下：
 当条件表达式为true时候跳过else语句中的内容，执行语句组内容
 条件表达式为false时候执行else语句中的内容，跳转语句一般是return、break、continue和throw
 */
func online(age : Int) -> Void {
    guard age >= 18 else {
        print("回家去")
        return
    }
    
    print("可以上网")
}
online(age : 18)


// ## switch
let gender = 0
switch gender {
case 0:
    fallthrough
case 1:
    print("男")
case 2:
    print("女")
default:
    print("其他")
}
/**
 swift中可使用区间,常见有两种
 开区间:0..<10 表示:0~9,不包括10
 闭区间:0...10 表示:0~10
 */
// 常规写法
for i in 0..<10 {
    print(i)
}

for i in (0..<10).reversed() {
    print(i)
}
// 特殊写法 (如果在循环中不需要用到下标)
for _ in 0..<10 {
    print("hello")
}



// ### 数组
// 定义时直接初始化
var array1 = ["x", "p", "h"]
// 先定义,后初始化
var array2 : Array<String> // 或者 var array2 : [String]
array2 = ["x", "p", "h"]
array2[0]




// ### 字典
// 定时字典的同时,进行初始化
var dictionary1 = ["name" : "xph", "age" : 18] as [String : Any]
// Swift中任意对象,通常不使用NSObject,使用AnyObject
var dictionary2 : Dictionary<String, AnyObject> // 或者 var dictionary2 : [String: AnyObject]
dictionary2 = ["name" : "xph" as AnyObject, "age" : 18 as AnyObject]
dictionary2["name"]



// ### 元组 (一般用于作为方法的返回值)
let info = (name : "xph", age : 18) // let info = ("xph", 18)
info.0
info.name



// ### 可选类型
/**
 Swift中规定对象中的任何属性在创建时都必须有明确的初始化值
 */
// 1.定义可选类型
//   1)方式一:常规方式(不常用)
//var name : Optional<String> = nil
//   2)方式二:语法糖(常用)
var name : String? = nil

// 2.给可选类型赋值
name = "xph"

// 3.取出可选类型中的值
print(name!)

// 4.上述的 '可选类型' + '!' 强制解包
// 强制解包非常危险,如果可选类型为nil,强制解包会导致系统崩溃
// 建议在强制解包前,先对可选类型进行判断,判断是否为nil
if name != nil {
    print(name!)
}

// 5.可选绑定 (第一步操作:判断name是否有值,第二步操作:如果name有值,系统会自动将name进行解包,并且将解包后的结果直接赋值给bindName)
// 写法一(不常用):
//if let bindName = name {
//    print(bindName)
//}

// 写法二(常用):
if let name = name {
    print(name)
}



// ### 函数
/**
 func是关键字,多个参数列表之间可以用逗号(,)分隔,也可以没有参数
 使用箭头'->'指向返回值类型
 如果函数没有返回值,返回值为Void,并且“-> 返回值类型”部分可以省略
 */
// 定义形式 : func 函数名(参数列表) ->返回值类型{}


// ## 1.无参无返回值
func func1() -> Void {
    print("无参无返")
}
func1()

// 简单写法
func func2() -> () {
    print("无参无返")
}
func2()

// 如果没有返回值,后面的内容可以都不写
func func3() {
    print("无参无返")
}
func3()


// ## 2.有参无返回值
var num = 0;
func func4(num : inout Int){
    num = 40
}
num
func4(num: &num)


// ## 3.无参有返回值 (无参单返,无参多返)
func func5() ->String{
    return "无参单返"
}
func5()

func func6() -> (name : String, age : Int) {
    return ("xph", 18)
}
func6()


// ## 4.有参有返回值 (有参单反,有参多返)
func func7(name : String, age : Int) -> Int{
    return age + 10
}
func7(name: "xph", age: 18)

func func8(name : String, age : Int) -> (name : String, age : Int) {
    return (name, age + 2)
}
func8(name: "xph", age: 18)

// 如果有多个不确定的参数
var result = 0
func more (numbers : Int...) -> Int {
    for num in numbers {
        result += num
    }
    return result
}
more(numbers: 1,8,4,6,5,2)

// 例:找出多个数中大于二十的数
let compareNum = 20
let arr = [11, 24, 31, 15, 26]
var resultArr = [Int]()
func find(array : Array<Int>, compare : Int) -> Array<Int> {
    for num in array {
        if num > compare {
            resultArr.append(num)
        }
    }
    return resultArr
}
find(array: arr, compare: compareNum)
