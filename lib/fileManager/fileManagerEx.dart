//本地化操作文件
import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

//算是FileManagerEx的增强实战版本
class UserInfoEx implements JsonClassTransform {
  String name;
  int age;

  UserInfoEx(this.name, this.age);

  //命名式构造方法，也可以是用工厂构造方法,可以很方便将获取到的jsonMap转化成对象
  UserInfoEx.fromJson(Map<String, dynamic> json): name = json['name'], age = json['age'];

  //如果想写成协议，归档(json和对象互转时，为了使用方便)时，可以继承协议，那么可以用普通方法，而不是构造方法
  @override
  Map<String, dynamic> toJson() =>
      {'name': name, 'age': age};
}

abstract class JsonClassTransform<T> {

  //通过本对象转化为 jsonMap
  Map<String, dynamic> toJson();
}

class FileManagerEx {

  //用于获取instance的，可以在block中使用sharedPreferences等操作
  //例如： setBool(getBool)  setInt(getInt)   setDouble(getDouble)   setString(getString) 
  static Future operator(Function(SharedPreferences instance) instanceBlock) async {
    final manager = await SharedPreferences.getInstance();
    instanceBlock(manager);
  }

  //也可以用本对象自己来通用调用，存放基本类型
  static saveInfo(String key, dynamic value) {
    FileManagerEx.operator((SharedPreferences instance) {
      instance.setString(key, value.toString());
    });
  }

  //获取信息
  static Future<dynamic> getInfo(String key) async {
    final manager = await SharedPreferences.getInstance();
    return manager.getString(key);
  }

  //通过block获取信息
  static getBaseInfoBlock(String key, Function(dynamic value) block) {
    FileManagerEx.operator((SharedPreferences instance) {
      block(instance.getString(key));
    });
  }

  //下面存取对象,可以自己封装一下
  //存放对象
  static saveObject(String key, JsonClassTransform value) {
    FileManagerEx.operator((SharedPreferences instance) {
      final userMap = value.toJson();
      final jsonString = jsonEncode(userMap);
      instance.setString(key, jsonString);
      log('saveObject' + jsonString);
    });
  }

  //可以自行通过async await阻塞一下，以达到同步效果
  static Future saveObjectSync(String key, JsonClassTransform value) async {
    final manager = await SharedPreferences.getInstance();
    final userMap = value.toJson();
    final jsonString = jsonEncode(userMap);
    await manager.setString(key, jsonString);
    await Future.delayed(const Duration(seconds: 2), () {
      log('delayed');
    });
  }

  //读取对象
  //返回jsonMap，可以自行通过构造方法快速转化
  static Future<dynamic> getObject(String key) async {
    final manager =  await SharedPreferences.getInstance();
    final jsonString = manager.getString(key);
    if (jsonString != null) {
      log('getObject' + jsonString);
      return jsonDecode(jsonString);
    }
    return null;
  }

  //返回jsonMap，可以自行通过构造方法快速转化
  static getObjectBlock(String key, Function(Map<String, JsonClassTransform>? value) block) {
    FileManagerEx.operator((SharedPreferences instance) {
      final jsonString = instance.getString(key);
      if (jsonString != null) {
        block(jsonDecode(jsonString));
      }else {
        block(null); 
      }
    });
  }

  //删除
  static remove(String key) async {
    final manager =  await SharedPreferences.getInstance();
    manager.remove(key);
  }
}



