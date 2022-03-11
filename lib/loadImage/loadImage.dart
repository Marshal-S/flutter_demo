import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//加载图片
class LoadImage extends StatelessWidget {
  const LoadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          //加载图片
          Container(
            color: Colors.white,
            //加载本地图片
            child: Image.asset("images/WechatIMG21002.jpeg"),
          ),
          //这个跟上面一样，认识即可
          Container(
            color: Colors.white,
            //加载本地图片
            child: const Image(image: AssetImage('images/WechatIMG21002.jpeg')),
          ),

          //加载网络图片
          Container(
            color: Colors.white,
            child: Image.network("https://img0.baidu.com/it/u=2907855715,3034528164&fm=253&fmt=auto&app=138&f=JPEG?w=890&h=500"),
          ),
          Container(
            color: Colors.white,
            //网络加载图片后，采用渐变方式渲染图片，可以设置渐变时长
            child: FadeInImage.assetNetwork(
              placeholder: "images/WechatIMG21002.png", //预览图
              fit: BoxFit.fitWidth, //自适应宽度
              height: 140, //可以设置高度
              image: "https://img0.baidu.com/it/u=2907855715,3034528164&fm=253&fmt=auto&app=138&f=JPEG?w=890&h=500",
            ),
          ),

          //使用三方框架，下载图片完毕后，会缓存到本地使用
          Container(
            color: Colors.white,
            child: CachedNetworkImage(
                imageUrl: "https://img2.baidu.com/it/u=479460895,312746087&fm=253&fmt=auto&app=120&f=JPEG?w=889&h=500"
            ),
          ),

          //可以拖拽文件到终端，路径揪出来了，直接copy到 pubspec.yaml文件对应位置中即可
          //加载android中mipmap图片，路径 android/app/src/main/res/
          Container(
            color: Colors.white,
            height: 140,
            child: Image.asset("android/app/src/main/res/mipmap-mdpi/ic_launcher.png"),
          ),

          //加载ios中Assets.xcassets的图片，路径ios/Runner/Assets.xcassets/
          Container(
            color: Colors.white,
            height: 140,
            child: Image.asset("ios/Runner/Assets.xcassets/logo.imageset/logo.png"),
          ),

        ]
    );
  }
}

