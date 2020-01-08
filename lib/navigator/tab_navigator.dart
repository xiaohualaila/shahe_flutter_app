import 'package:flutter/material.dart';

import '../content_pager.dart';



class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activityColor = Colors.green;
  int _currentIndex = 0;
  final ContentPagerController _contentPagerController = ContentPagerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffedeef0), Color(0xffe6e7e9)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ContentPager(
          contentPagerController: _contentPagerController,
          onPageChanged: (int index){
            setState(() {
              _currentIndex =index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem("首页", Icons.folder, 0),
          _bottomItem("应急停产", Icons.explore, 1),
          _bottomItem("地图", Icons.map, 2),
          _bottomItem("我的", Icons.near_me, 3),
        ],
        onTap: (index) {
          _contentPagerController.jumTopage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _defaultColor,
      ),
      activeIcon: Icon(icon, color: _activityColor),
      title: Text(
        title,
        style: TextStyle(
            color: _currentIndex != index ? _defaultColor : _activityColor),
      ),
    );
  }
}
