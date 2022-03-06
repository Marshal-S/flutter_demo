import 'package:flutter/material.dart';

class MyWidge extends StatelessWidget {
  const MyWidge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //可以使用这个变量
    const textStyle = TextStyle(
        color: Colors.green,
        fontSize: 32,
        fontWeight: FontWeight.bold
    );

    return const Center(
        child: Text("hello world!",
          textAlign: TextAlign.center,
          style: TextStyle( //可以在前面声明直接使用变量
              color: Colors.blue,
              fontSize: 36,
              fontWeight: FontWeight.bold
          ),
        )
    );
  }
}