import 'package:flutter/material.dart';

//常见布局以及组件介绍
//Flex、Column、Row、Container、Alignment、Flexible、Stack、Position、Wrap
//ListView(滚动视图UIScrollView)、ListView.Builder(表格视图UITableView)、textButton、Image、text

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.vertical, //默认垂直滚动
      children: <Widget>[
        //Flex布局中的垂直方向布局，默认继承Flex布局，主轴方向默认设置垂直方向
        Column(
          mainAxisAlignment: MainAxisAlignment.start, //主轴
          crossAxisAlignment: CrossAxisAlignment.center,//次轴
          children: <Widget>[
            //Flex布局中的水平方向布局，默认继承Flex布局，主轴方向默认设置水平方向
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text('左'),
                  Text('中'),
                  Text("右")
                ]
            ),
            //Flex盒式布局，Column和Row都是继承自他，也就是被称为万能布局的他
            Flex(
              //相当于Column，可以不用Comlum和Row，使用Flex打天下，当然有简单的为何不用是吧
                direction: Axis.vertical, //水平horizontal
                children: [
                  Container(
                      width: 300,
                      height: 60,
                      margin: const EdgeInsets.all(10),
                      // alignment: const Alignment(0, 0), //分别表示左右、上下对齐属性  0表示居中，-1表示居左/上, 1居右/下
                      alignment: Alignment.center, //设置每部元素排列方式，居中，相当于普通View
                      child: const Text('我是Layout,,配合container可以解决自己背景大小等问题')
                  )
                ]
            ),

            //我们测试一下绝对布局
            const AbsoluteView(),

            //测试一下Wrap自动换行(列)布局
            const WrapView(),

            //根据数组生成一组组件，使用方便，可以创建一组图片之类的
            //常常配合 wrap使用，可以解决生成不定数量的组件问题
            const GenerateGroupWidget(),
          ],
        )
      ]
    );
  }
}


//绝对布局，通过Stack和Position类实现
//Stack就想Ios中的默认布局一样，可以重叠布局，间距位置需要其他组件来调节
//通过Stack和Position可以实现绝对布局效果，当然也可以配合其他组价实现相对布局效果
class AbsoluteView extends StatelessWidget {
  const AbsoluteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.blue,
      //设置一个Stack相对布局容器，被Container包围，方便设置颜色对比
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //设置一个Container，采用默认的方式居中
          Container(
            width: 200,
            height: 100,
            color: Colors.green,
            alignment: Alignment.center,
            //输入框
            child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "请输入手机号"//占位符
                )
            ),
          ),
          //使用Position，设置相对父布局的位置，这里居右上角，可以查看效果非常好
          //仅仅用Flex布局，类似这种稍微复杂点，就不是很好解决
          const Positioned(
              top: 0,
              right: 0,
              width: 200,
              child: Text("我是在Stack中的帧布局、绝对布局，配合Stack使用能随意调整距离边界位置，从而发挥出效果")
          )
        ],
      ),
    );
  }
}



//Wrap，能做层包围效果，会自动换行或者换列，需要了解具体属性，可以点进去
//其一般配合Flex布局使用，这里他自己就是一个特殊的Flex布局
//做一个简单的图片墙功能
class WrapView extends StatelessWidget {
  const WrapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 300,
          color: Colors.green,
          margin: const EdgeInsets.only(top: 10),
          child: Wrap(
              direction: Axis.horizontal, //横向布局布局，布满换行
              alignment: WrapAlignment.start, //主轴
              crossAxisAlignment: WrapCrossAlignment.start, //次轴
              spacing: 10, //主轴上的内容间距
              runSpacing: 20, //次轴的内容间距
              children: <Widget>[
                Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: const Text('我是中间的文字')
                ),
                Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: const Text('我是中间的文字')
                ),
                Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: const Text('我是中间的文字')
                ),
                Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: const Text('我是中间的文字')
                )
              ]
          ),
        ),

        //主轴为纵向布局，布满了之后，换列
        Container(
          width: 300,
          height: 300,
          margin: const EdgeInsets.only(top: 10),
          color: Colors.white,
          child: Wrap(
              direction: Axis.vertical, //主轴方向垂直布局，布满换列
              alignment: WrapAlignment.start, //主轴
              crossAxisAlignment: WrapCrossAlignment.start, //次轴
              spacing: 10, //主轴上的内容间距
              runSpacing: 20, //次轴的内容间距
              children: <Widget>[
                Container(
                    width: 80,
                    height: 80,
                    color: Colors.red,
                    child: const Text('我是中间的文字')
                ),
                Container(
                    width: 80,
                    height: 80,
                    color: Colors.red,
                    child: const Text('我是中间的文字')
                ),
                Container(
                    width: 80,
                    height: 80,
                    color: Colors.red,
                    child: const Text('我是中间的文字')
                ),
                Container(
                    width: 80,
                    height: 80,
                    color: Colors.red,
                    child: const Text('我是中间的文字')
                )
              ]
          ),
        )

      ],
    );
  }
}

//方便的生成一组相似的内容，实际工作中很容易就用到，很方便
class GenerateGroupWidget extends StatelessWidget {
  const GenerateGroupWidget({Key? key}) : super(key: key);

  //直接生成一组组件
  List<Widget> getListContaner() {
    var list = <Widget>[];
    for (final element in [1, 2, 3, 4, 5, 6, 7, 8]) {
      list.add(Container(
          width: 80,
          height: 30,
          color: Colors.red,
          child: Text('$element')
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: getListContaner(),
    );
  }
}



