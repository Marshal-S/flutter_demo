import 'package:flutter/material.dart';
import 'package:flutter_demo/router/routerPages.dart';

class MyRouterApp extends StatelessWidget {
  const MyRouterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter router",
      //如果不用名字跳转的话，这一个不用声明
      routes: {
        'RouterPage1': (BuildContext context) => const RouterPage1.noParams(),
        'RouterPage2': (BuildContext context) => const RouterPage2(),
        'HomePage': (BuildContext context) => const HomeRouterPage(),
      },
      home: const HomeRouterPage(),
    );
  }
}

class HomeRouterPage extends StatelessWidget {
  const HomeRouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("我是router案例的首页"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              //如果觉得不方便的话，可以写一个navigation的扩展封装起来，来换一个接口调用
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const RouterPage1("我是首页传递的数据")));

              //push同时，可以接收pop反向传值
              // Navigator
              //     .push(context, MaterialPageRoute(builder: (context) => const RouterPage1("我是首页传递的数据")))
              //     .then((value) {
              //   log("我是第一页反向传递过来的value");
              //   print(value);
              // });

              //通过name push，看起来更适合跳转固定设置好的界面
              // Navigator.pushNamed(context, "RouterPage1");
              //和上面一样
              // Navigator.of(context).pushNamed("routeName");
            },
            child: const Text('跳转route案例的第一页'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const RouterPage2()));

              //push同时，可以接收pop反向传值
              // Navigator
              //     .push(context, MaterialPageRoute(builder: (context) => const RouterPage2()))
              //     .then((value) {
              //   log("我是第二页反向传递过来的value");
              //   log(value);
              //   print(value);
              // });

              //通过name push
              // Navigator.pushNamed(context, "RouterPage2");
            },
            child: const Text('跳转route案例的第二页'),
          ),
        ],
      )
    );
  }
}

