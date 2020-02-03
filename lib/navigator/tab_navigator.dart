import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/home_page.dart';
import 'package:flutter_travel/pages/my_page.dart';
import 'package:flutter_travel/pages/search_page.dart';
import 'package:flutter_travel/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        // 监听页面变化时改变_currentIndex来实时更新TabBar的状态
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // 四个页面
        children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // 点击TabBar切换页面
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        // 设置TabBar的label一直存在
        type: BottomNavigationBarType.fixed,
        items: [
          // 分别设置4个TabBar对应的icon和激活与未激活颜色
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _defaultColor),
              activeIcon: Icon(
                Icons.home,
                color: _activeColor,
              ),
              title: Text(
                "首页",
                style: TextStyle(
                    color: _currentIndex != 0 ? _defaultColor : _activeColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _defaultColor),
              activeIcon: Icon(
                Icons.search,
                color: _activeColor,
              ),
              title: Text(
                "搜索",
                style: TextStyle(
                    color: _currentIndex != 1 ? _defaultColor : _activeColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, color: _defaultColor),
              activeIcon: Icon(
                Icons.camera_alt,
                color: _activeColor,
              ),
              title: Text(
                "旅拍",
                style: TextStyle(
                    color: _currentIndex != 2 ? _defaultColor : _activeColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: _defaultColor),
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeColor,
              ),
              title: Text(
                "我的",
                style: TextStyle(
                    color: _currentIndex != 3 ? _defaultColor : _activeColor),
              )),
        ],
      ),
    );
  }
}
