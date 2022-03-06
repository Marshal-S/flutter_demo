import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //container可以理为UIView，有点像div
    return Container(
      color: Colors.white,
      child: Column( //默认为垂直方向布局, Row为水平方向布局
        mainAxisAlignment: MainAxisAlignment.start,//主方向默认布局方式(垂直)
        crossAxisAlignment: CrossAxisAlignment.start, //副方向(水平)
        children: <Widget>[
          //container也可以像text一样放置东西,可以调整间距等
          Container(
            width: 200,
            alignment: Alignment.centerLeft, //可以尝试里面的数据，内容对齐到哪里去
            height: 100,
            child: const Text('我是第一个Container元素',
            )
          ),
          const Text('我是Text'),
          Container(
              width: 200,
              alignment: Alignment.center,//内容居中
              height: 100,
              child: const Text('我是第二个Container元素')
          )
        ]
      )
    );
  }
}
