import 'package:flutter/material.dart';
import 'package:flutter_travel/navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//   TabNavigator来切换不同tab下的页面
      home: TabNavigator()
    );
  }
}
