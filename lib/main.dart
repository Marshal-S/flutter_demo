import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_demo/fileManager/fileManager.dart';
import 'package:flutter_demo/router/router.dart';
import 'package:flutter_demo/statusAndLayout/layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'demo/hello_world.dart';
import 'demo/list_view.dart';
import 'fileManager/fileManagerEx.dart';
import 'loadImage/loadImage.dart';
import 'statusAndLayout/counter.dart';

void main() {
  runApp(const MyApp());
  testFileManager();
  testFileManagerEx();

  //测试Router跳转传值的案例
  // runApp(const MyRouterApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterDemo",
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: const Text('hello word!'),
          ),
          //尝鲜篇
          body: const MyWidge()
          // body: const ContainerView(),
          // body: const RichTextView(),
          // body: const CarListView()

          //State layout
          // body: const Counter()
          // body: const Layout()

          //image
          // body: const LoadImage()
      )
    );
  }
}



//测试一下本地储存与读取
testFileManager() async {
  log('测试本地化开始了');
  await FileManager.saveInfo<String>("username", "Marshal");
  final string = await FileManager.readInfo("username");
  log('username---' + string); //平时可以使用log代替 print，相对更容易看到打印

  await FileManager.saveObject('user_info', UserInfo("Marshal", 20));
  final userInfo = await FileManager.readObject('user_info');
  if (userInfo == null) return;
  log('userInfo---userName:' + userInfo.name + '--age:' + userInfo.age.toString());
}

//使用过程可能觉的，虽然async，但并不是异步执行的呀
//async和await搭配会阻塞当前方法的执行，放入到以达到模拟异步的结果
//因此，这里一旦出现await，就会等待前面await的执行完毕，然后在一个一个执行当前方法解除等待，因此看起来像同步效果
testFileManagerEx() async {
  log('测试本地化Ex开始了');
  FileManagerEx.saveInfo("username", "Marshal2");
  final string = await FileManagerEx.getInfo("username");
  log('username---' + string.toString());

  FileManagerEx.operator((SharedPreferences instance) {
    instance.setInt('age', 24);
    final age = instance.getInt('age');
    log('age---$age');
  });

  FileManagerEx.saveObject('user_info', UserInfoEx("Marshal2", 24));
  final userInfoMap = await FileManagerEx.getObject('user_info');
  if (userInfoMap == null) return;
  final userInfo = UserInfoEx.fromJson(userInfoMap);
  log('userInfo---userName:' + userInfo.name + '--age:' + userInfo.age.toString());
}