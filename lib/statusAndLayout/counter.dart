import 'package:flutter/material.dart';

//一个自增器，简单阐述
class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void onPress() {
    setState(() {
      // _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Flexible就是flexbox布局的flex，
        //设置fit: FlexFit则当前组件可以分配剩余空间
        //flex则根据当前flex与当前层级层级的Flexible的flex总占用比分配
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            //不设置宽高默认填满
              color: Colors.black,
              // alignment: const Alignment(0, 0), //分别表示左右、上下对齐属性  0表示居中，-1表示居左/上, 1居右/下
              alignment: Alignment.center, //一般使用这个属性，上面的在百分比位置的时候使用
              //放一个按钮
              child: TextButton(
                  onPressed: onPress,
                  child: Text('我是会自增的工具:$_count')
              )
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            //不设置宽高默认填满
              color: Colors.cyan,
              // alignment: const Alignment(0, 0), //分别表示左右、上下对齐属性  0表示居中，-1表示居左/上, 1居右/下
              alignment: Alignment.center, //一般使用这个属性，上面的在百分比位置的时候使用
              //放一个按钮
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      _count--;
                    });
                  },
                  child: Text('我是会自减的工具:$_count')
              )
          ),
        )
      ],
    );
  }
}

