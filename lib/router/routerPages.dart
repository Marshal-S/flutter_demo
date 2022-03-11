
import 'package:flutter/material.dart';

class RouterPage1 extends StatelessWidget {
  //注意到这个方法没有，这个就是他的构造方法，只不过默认调用父类的构造方法来初始化，
  //传参往前加自己的变量就是了,就和普通的dart构造方法类似了
  const RouterPage1(this.receiveName, {Key? key}) : super(key: key);
  //加一个无参构造方法，调用它就可以不传参数了
  const RouterPage1.noParams({Key? key}) : receiveName = '', super(key: key);

  final String receiveName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("router第一页"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pop(context, '我是第一页传递回去的内容');
              },
              child: const Text('返回上一页'),
            ),
            Text(receiveName)
          ],
        )
      )
    );
  }
}


class RouterPage2 extends StatefulWidget {
  const RouterPage2({Key? key}) : super(key: key);

  @override
  State<RouterPage2> createState() => _RouterPage2State();
}

class _RouterPage2State extends State<RouterPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("router第二页"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.pop(context, '我是第二页传递回去的内容');
          },
          child: const Text('返回上一页'),
        ),
      )
    );
  }
}
