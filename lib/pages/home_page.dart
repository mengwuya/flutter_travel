import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "https://www.itying.com/images/flutter/1.png",
    "https://www.itying.com/images/flutter/2.png",
    "https://www.itying.com/images/flutter/3.png",
  ];

  // 初始默认是不显示
  double appBaralpha = 0;

  // 监听滚动时 实现渐变效果
  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    // 边界条件时需要补效果
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBaralpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        // 用来去除Scaffold顶部的padding
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            // 监听滚动条的位置
            child: NotificationListener(
              // ignore: missing_return
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              // 使用ListView配合Swiper轮播图插件实现轮播
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      // 使用itemBuilder和itemCount来循环_imageUrls中的图片
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      // 设置圆点区分激活状态
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text("哈哈"),
                    ),
                  )
                ],
              ),
            )),
        // 将内容放在Opacity里可以实现透明变化效果
        Opacity(
          // 必传参数
          opacity: appBaralpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("首页"),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
