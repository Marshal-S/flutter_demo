//本地化操作文件
import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

//选中类名，摁着 ctl + enter，生成 Constructor，选择需要默认初始化的属性，可以生成带参构造方法
class UserInfo {
  String name;
  int age;

  UserInfo(this.name, this.age);

  //命名式构造方法，也可以是用工厂构造方法
  UserInfo.fromJson(Map<String, dynamic> json): name = json['name'], age = json['age'];

  //如果想写成协议，归档(json和对象互转时，为了使用方便)时，可以继承协议，那么可以用普通方法，而不是构造方法
  Map<String, dynamic> toJson() =>
      {'name': name, 'age': age};
}

class FileManager {
  static saveInfo<T>(String key, T value) async {
    final manager =  await SharedPreferences.getInstance();
    //默认的使用只有如下几种
    // manager.setBool(key, value as bool);
    // manager.setDouble(key, value as double);
    // manager.setInt(key, value as int);
    manager.setString(key, value as String);
    // manager.setStringList(key, value as List<String>);
  }

  //获取内容，获取根据具体类型，实际不推荐用泛型，即是全部是字符串
  static Future<T> readInfo<T>(String key) async {
    final manager = await SharedPreferences.getInstance();
    return manager.getString(key) as T;
  }


  //下面存取对象,可以自己封装一下
  //存放对象
  static saveObject(String key, UserInfo value) async {
    final manager =  await SharedPreferences.getInstance();

    //实际上可以将 UserInfo设置为泛型约束，继承(or多继承)某个类或者实现某一个接口,通过该接口调用toJson方法
    //将一个类转化为jsonString
    //此过程需要调用对应类的 toJson 方法，现将类信息放到 Map 中，然后在转化成json
    final userMap = value.toJson();
    //然后调用jsonEncode将map转化成 jsonString
    final jsonString = jsonEncode(userMap);

    //jsonEncode默认只能将map转化成json，因此需要利用二个回调，将对象转化为map，然后才进行的转化
    //实际和上面一样
    final jsonString2 = jsonEncode(value,
        toEncodable: (Object? value) => value is UserInfo
            ? value.toJson()
            : throw UnsupportedError('Cannot convert to JSON: $value'));

    if (jsonString.isEmpty) return;
    manager.setString(key, jsonString);
    log('jsonEncode --' + jsonString);
  }

  //读取对象
  static Future<dynamic> readObject(String key) async {
    final manager =  await SharedPreferences.getInstance();
    final jsonString = manager.getString(key);
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString); //转化成 Map
      log('jsonDecode --' + jsonMap.toString());
      //实际使用中，可以直接返回 Map 集合，从外面给类赋值，以减少耦合
      return UserInfo.fromJson(jsonMap); //根据根据命名式构造方法转化
    }
    return null;
  }

  static remove(String key) async {
    final manager =  await SharedPreferences.getInstance();
    manager.remove(key);
  }

}



