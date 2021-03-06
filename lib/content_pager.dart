
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shahe_flutter_app/page/map_page.dart';
import 'package:shahe_flutter_app/page/first_page.dart';
import 'package:shahe_flutter_app/page/me_page.dart';

import 'page/yingji_stop_page.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;
  const ContentPager({Key key, this.onPageChanged, this.contentPagerController}) : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = new PageController(viewportFraction: 1);

  @override
  void initState() {
    _statuBar();
    if(widget.contentPagerController!=null){
       widget.contentPagerController._pageController= _pageController;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Expanded(
          child: PageView(
            onPageChanged: widget.onPageChanged,
            controller: _pageController,
            children: <Widget>[
              FirstPage(),
              YingjiPage(),
              MapPage(),
              MePage(),

            ],
          ),
        )
      ],
    );
  }


  ///设置沉浸式状态栏
  _statuBar(){
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

class ContentPagerController{

  PageController _pageController;
  void jumTopage(int page){
    _pageController?.jumpToPage(page);
  }
}
