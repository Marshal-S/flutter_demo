import 'package:flutter/material.dart';

class RichTextView extends StatelessWidget {
  const RichTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //外面的Container不是必须的，只是备用，可以用来调整间距的
    return Container(
      alignment: Alignment.topCenter,
      child: RichText(
        text: const TextSpan(
          text: "我是",//也可以不设置Text，后面不设置属性的默认此style
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,//默认的可以不用填写
            color: Colors.black12
          ),
          children: <TextSpan>[
            TextSpan(text: '一名'),
            TextSpan(
              text: 'ios',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red
              )
            ),
            TextSpan(text: '、'),
            TextSpan(
                text: 'flutter',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow
                )
            ),
            TextSpan(text: '开发者')
          ]
        )
      ),
    );
  }
}
