import 'package:flutter/material.dart';
import 'car.dart';

class CarListView extends StatelessWidget {
  const CarListView({Key? key}) : super(key: key);

  //可以将row的内容放到这里main
  Widget cellForRow(BuildContext context, int index) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    //想控制ListView的内间距或者外间距，可以尝试嵌套 Container
    return ListView.builder(
        itemCount: carsDatas.length,
        // itemBuilder: cellForRow, //可以指向外部方法
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              // Container(
              //   width: 300,
              //   height: 100,
              //   child: Image.network(carsDatas[index].imageUrl,
              //     fit: BoxFit.fitWidth, 当外部有container的时候，可以设置填充方式,默认平铺
              //   ),
              // ),
              //网络加载图片，没有本地缓存
              Image.network(carsDatas[index].imageUrl,
                fit: BoxFit.fitWidth,
              ),
              Container(height: 8),
              Text(carsDatas[index].name),
              Container(height: 8)
            ],
          );
        }
    );
  }
}
