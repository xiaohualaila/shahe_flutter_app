import 'package:flutter/material.dart';
import 'package:shahe_flutter_app/me/about_soft.dart';
import 'package:shahe_flutter_app/me/system_setup.dart';
import 'package:shahe_flutter_app/page/welcome_page.dart';
import 'package:shahe_flutter_app/navigator/tab_navigator.dart';
import 'package:shahe_flutter_app/me/update_app.dart';
import 'package:shahe_flutter_app/test/http.dart';
import 'package:shahe_flutter_app/test/http_async.dart';
import 'package:shahe_flutter_app/test/share_prefs.dart';
import 'page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
//        fontFamily: 'aliIcon'//设置字体
      ),
      home: WelcomePage(),
      routes: <String,WidgetBuilder>{
        'about_soft':(BuildContext context)=>AboutSoftPage(),
        'setup':(BuildContext context)=>SetupPage(),
        'update_app':(BuildContext context)=>UpdateAppPage(),
        'tab_navigator':(BuildContext context)=>TabNavigator(),
        'http_test':(BuildContext context)=>HttpDemo(),
        'http_async_test':(BuildContext context)=>HttpAsyncDemo(),
        'share_prefs':(BuildContext context)=>SharePrefsDemo(),
        'login_page':(BuildContext context)=>LoginPage(),
      }
    );
  }
}

class RouteNavigatorState extends StatefulWidget {
  @override
  _RouteNavigatorStateState createState() => _RouteNavigatorStateState();
}

class _RouteNavigatorStateState extends State<RouteNavigatorState> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



